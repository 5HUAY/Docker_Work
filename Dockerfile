FROM node:latest
RUN npm install -g npm@latest
WORKDIR /app

FROM node:20-alpine

WORKDIR /app

# Встановлення NestJS CLI глобально
RUN npm install -g @nestjs/cli

COPY package*.json ./
RUN npm install

COPY . .

CMD ["npm", "run", "start:dev"]
# Dockerfile
FROM node:20-alpine

# Копіюємо package.json та package-lock.json
COPY src/package*.json ./

# Встановлюємо залежності
RUN npm install

# Копіюємо весь проект
COPY src/. .

# Виставляємо порт
EXPOSE 3000
