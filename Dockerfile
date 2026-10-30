FROM nginx:alpine

LABEL org.opencontainers.image.title="my-development-workstation"

ENV APP_ENV=development

COPY site/ /usr/share/nginx/html/
