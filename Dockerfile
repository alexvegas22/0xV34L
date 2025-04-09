FROM klakegg/hugo:0.145.0-ext-alpine AS build
WORKDIR /src
COPY . .
RUN hugo --minify

FROM nginx:alpine
COPY --from=build /src/public /usr/share/nginx/html
