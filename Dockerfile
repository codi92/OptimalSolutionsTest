FROM nginx:latest
COPY nginx/ /etc/nginx/
COPY index.html /var/www/app.slajnev.tk/public/
