FROM floryn90/hugo:0.165.0 AS build

WORKDIR /src

COPY . .

RUN hugo

FROM nginx:1.31.4-alpine
COPY --from=build /src/public/ /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
