# this same shows how we can extend/change an existing official image from Docker Hub

FROM nginx:latest
# highly recommend you always pin versions for anything beyond dev/learn

COPY /web-app-static/ /usr/share/nginx/html/

EXPOSE 80 443     

CMD ["nginx", "-g", "daemon off;"]