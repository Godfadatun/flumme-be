# syntax=docker/dockerfile:1.7
ARG NODE_VERSION=20.12.2

############################
# Base
############################
FROM node:${NODE_VERSION}-alpine AS base
WORKDIR /usr/src/app
# Use npm; if you prefer pnpm/yarn, enable corepack and adjust commands
COPY package*.json ./
# Install deps once and cache layer (ignores postinstall scripts for speed)
RUN npm ci --ignore-scripts

############################
# Dev (hot reload)
############################
FROM base AS dev
# Optional: CLI inside container for generators
RUN npm i -g @nestjs/cli
COPY . .
EXPOSE 3000
# Nest start:dev watches files; volume mount will handle live reload
CMD ["npm", "run", "start:dev"]

############################
# Build
############################
FROM base AS build
COPY . .
RUN npm run build

############################
# Prod runtime
############################
FROM node:${NODE_VERSION}-alpine AS prod
WORKDIR /usr/src/app
ENV NODE_ENV=production
COPY --from=build /usr/src/app/package*.json ./
RUN npm ci --omit=dev --ignore-scripts
COPY --from=build /usr/src/app/dist ./dist
EXPOSE 3000
CMD ["node", "dist/main.js"]
