FROM httpd

COPY . /usr/local/apache2/htdocs
RUN . /usr/local/apache2/htdocs
