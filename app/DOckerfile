FROM ubuntu
WORKDIR /app
COPY index.html /usr/share/nginx/html/
RUN rm -rf /usr/share/nginx/html/*
CMD ["nginx", "-g" "daemon off:"]

