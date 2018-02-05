FROM nginx:latest
# highly recommend you always pin versions for anything beyond dev/learn

COPY /web-app-static/ /usr/share/nginx/html/

EXPOSE 80 443     

CMD ["nginx", "-g", "daemon off;"]