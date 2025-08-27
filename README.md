# Flumme API

<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="120" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg" alt="Donate us"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow" alt="Follow us on Twitter"></a>
</p>

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository with Docker support for development and production environments.

## Prerequisites

Before running this project, ensure you have the following installed:

- **Node.js** (v18 or higher)
- **npm** or **yarn**
- **Docker Desktop** (for containerized development)
- **Git**

### Installing Docker Desktop

If you don't have Docker Desktop installed:

**macOS:**
```bash
# Using Homebrew
brew install --cask docker

# Or download from https://www.docker.com/products/docker-desktop
```

**Windows:**
- Download from [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop)

**Linux:**
- Follow the [Docker Engine installation guide](https://docs.docker.com/engine/install/)

## Development Environment Setup

### Option 1: Docker (Recommended)

This is the easiest way to get started as it includes the database and all dependencies.

1. **Clone the repository:**
```bash
git clone <repository-url>
cd flumme
```

2. **Start Docker Desktop:**
   - Open Docker Desktop application
   - Wait for it to fully start (you should see the Docker icon in your menu bar)

3. **Build and run the application:**
```bash
# Build and start all services
docker compose up --build

# Or run in detached mode (background)
docker compose up --build -d
```

4. **Access the application:**
   - API: http://localhost:3000
   - Database: PostgreSQL on localhost:5432

5. **View logs:**
```bash
# View all logs
docker compose logs

# View specific service logs
docker compose logs nest-api
docker compose logs nest-db

# Follow logs in real-time
docker compose logs -f
```

6. **Stop the application:**
```bash
# Stop and remove containers
docker compose down

# Stop and remove containers + volumes (will delete database data)
docker compose down -v
```

### Option 2: Local Development

If you prefer to run the application locally without Docker:

1. **Install dependencies:**
```bash
npm install
```

2. **Set up the database:**
   - Install PostgreSQL locally
   - Create a database named `flumme`
   - Update database connection settings in your environment

3. **Run the application:**
```bash
# development
npm run start

# watch mode (recommended for development)
npm run start:dev

# production mode
npm run start:prod
```

## Project Structure

```
flumme/
├── src/                    # Application source code
│   ├── app.controller.ts   # Main controller
│   ├── app.service.ts      # Main service
│   ├── app.module.ts       # Root module
│   └── main.ts            # Application entry point
├── test/                   # Test files
├── dist/                   # Compiled output
├── Dockerfile             # Docker configuration
├── docker-compose.yml     # Docker Compose configuration
└── package.json           # Dependencies and scripts
```

## Available Scripts

```bash
# Development
npm run start              # Start the application
npm run start:dev          # Start in watch mode (auto-reload)
npm run start:debug        # Start in debug mode
npm run start:prod         # Start in production mode

# Testing
npm run test               # Run unit tests
npm run test:watch         # Run tests in watch mode
npm run test:cov           # Run tests with coverage
npm run test:debug         # Run tests in debug mode
npm run test:e2e           # Run end-to-end tests

# Building
npm run build              # Build the application
npm run build:webpack      # Build with webpack

# Linting
npm run lint               # Run ESLint
npm run lint:fix           # Fix ESLint issues
```

## Docker Commands Reference

```bash
# Build images
docker compose build

# Start services
docker compose up

# Start services in background
docker compose up -d

# Stop services
docker compose down

# View running containers
docker compose ps

# Execute commands in running containers
docker compose exec nest-api npm run test
docker compose exec nest-db psql -U postgres -d flumme

# View container logs
docker compose logs nest-api
docker compose logs nest-db

# Rebuild and restart services
docker compose up --build

# Remove all containers and volumes
docker compose down -v
```

## Troubleshooting

### Docker Issues

**"Cannot connect to the Docker daemon"**
- Make sure Docker Desktop is running
- Restart Docker Desktop if needed

**"docker compose command not found"**
- Install Docker Compose: `brew install docker-compose`
- Or use: `docker-compose` (with hyphen) instead of `docker compose`

**Port already in use**
- Stop other services using ports 3000 or 5432
- Or change ports in `docker-compose.yml`

**Permission denied errors**
- Make sure your user has Docker permissions
- On macOS/Linux: `sudo usermod -aG docker $USER`

### Application Issues

**Database connection errors**
- Ensure PostgreSQL container is running: `docker compose ps`
- Check database logs: `docker compose logs nest-db`

**Node modules not found**
- Rebuild the container: `docker compose up --build`
- Or install locally: `npm install`

**Hot reload not working**
- Ensure you're using `npm run start:dev` or Docker with volume mounts
- Check file permissions in mounted volumes

## Environment Variables

Create a `.env` file in the root directory for local development:

```env
# Database
DATABASE_URL=postgresql://postgres:password@localhost:5432/flumme

# Application
NODE_ENV=development
PORT=3000
```

## API Documentation

Once the application is running, you can access:

- **Health Check**: GET http://localhost:3000/
- **API Documentation**: Available at http://localhost:3000/api (if Swagger is configured)

## Testing

```bash
# Run all tests
npm run test

# Run tests in watch mode
npm run test:watch

# Run end-to-end tests
npm run test:e2e

# Run tests with coverage
npm run test:cov
```

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

## License

This project is [MIT licensed](LICENSE).
