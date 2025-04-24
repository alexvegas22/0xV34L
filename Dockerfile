FROM klakegg/hugo:ext-alpine AS build

WORKDIR /src
COPY . .

RUN hugo build
RUN hugo --minify

FROM nginx:alpine
COPY --from=build /src/public /usr/share/nginx/html
RUN chown -R nginx:nginx /usr/share/nginx/html
