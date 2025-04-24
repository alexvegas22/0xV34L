FROM klakegg/hugo:ext-alpine AS build

RUN apk add --no-cache git

WORKDIR /src
COPY . .

RUN git submodule update --init --recursive --depth 1
RUN hugo build
RUN hugo --minify

FROM nginx:alpine
COPY --from=build /src/public /usr/share/nginx/html
RUN chown -R nginx:nginx /usr/share/nginx/html
