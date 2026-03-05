FROM ubuntu
WORKDIR /app
COPY index.html /usr/share/nginx/html/
RUN apt update && apt install nginx -y
CMD ["nginx", "-g", "daemon off:"]

