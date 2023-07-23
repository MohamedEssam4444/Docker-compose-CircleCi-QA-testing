# Dockerfile for React app
FROM node:14 AS react-builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production stage for React app
FROM node:14
WORKDIR /app
COPY --from=react-builder /app/build ./build
EXPOSE 3000
CMD ["npm", "start"]
