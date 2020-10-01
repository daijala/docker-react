# Builder phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json ./
RUN npm install

COPY ./ ./

RUN npm run build

# New phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# nginx will start up automatically when the container runs