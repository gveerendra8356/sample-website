# Use the lightweight official nginx image
FROM nginx:alpine

# Copy our website files into nginx's default web root
COPY index.html /usr/share/nginx/html/
COPY style.css  /usr/share/nginx/html/

# nginx serves on port 80 inside the container
EXPOSE 80
