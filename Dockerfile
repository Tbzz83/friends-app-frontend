# Dockerfile for frontend

# Build stage
FROM node:16 as build

WORKDIR /app
COPY . .

# Set environment variable for API base URL
ENV VITE_API_BASE_URL=http://backend:5000/api

RUN npm install
RUN npm run build

# Production stage
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html

