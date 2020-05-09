FROM httpd:alpine

# SSL/HTTPS
RUN sed -i \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        conf/httpd.conf

COPY openssl/server.crt /usr/local/apache2/conf/server.crt
COPY openssl/server.key /usr/local/apache2/conf/server.key

# .htaccess
RUN sed -i \
        -e 's/^#\(LoadModule .*mod_rewrite.so\)/\1/' \
        # Ideally, we should not have changed.
        # This is a intentional change to confirm that the access is restricted by editing the .htaccess file.
        -e 's/^    AllowOverride None$/    AllowOverride All/' \
        -e 's/^    Require all denied$/    Require all granted/' \
        conf/httpd.conf
