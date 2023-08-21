FROM nginx:1.9-alpine

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY api.conf /etc/nginx/conf.d/web.conf
