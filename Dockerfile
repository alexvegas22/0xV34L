FROM razonyang/hugo:latest AS build

WORKDIR /src
COPY . .

RUN hugo

RUN hugo \
    --minify \
    --baseURL "/" \
    --cleanDestinationDir

RUN ls -la /src/public

FROM nginx:alpine
COPY --from=build /src/public /usr/share/nginx/html
RUN chmod -R 755 /usr/share/nginx/html
