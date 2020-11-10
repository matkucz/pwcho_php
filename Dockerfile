FROM scratch
ADD files/alpine-minirootfs-3.12.1-x86_64.tar.gz /
LABEL maintainer="mateusz.kuczynski@pollub.edu.pl"
ENV PHPVERSION=7
RUN apk add --update apache2 php${PHPVERSION}-apache2 php${PHPVERSION}
RUN rm -rf /var/cache/apk/*
RUN rm -rf /var/www/localhost/htdocs/index.html
RUN echo "<?php phpinfo(); ?>" > /var/www/localhost/htdocs/index.php
RUN chmod 755 /var/www/localhost/htdocs/index.php
EXPOSE 80
ENTRYPOINT ["httpd"]
CMD ["-D", "FOREGROUND"]