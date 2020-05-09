FROM httpd:alpine

# SSL/HTTPS
RUN sed -i \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        conf/httpd.conf

COPY openssl/server.crt /usr/local/apache2/conf/server.crt
COPY openssl/server.key /usr/local/apache2/conf/server.key
