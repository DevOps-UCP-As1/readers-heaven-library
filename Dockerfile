FROM node:22-alpine AS builder
WORKDIR /seg3-app
COPY . .
RUN npm ci
RUN npm run build

FROM nginx:1.27-alpine
COPY --from=builder /seg3-app/dist/ /usr/share/nginx/html