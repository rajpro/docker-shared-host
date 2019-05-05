FROM php:apache
ENV MYSQL_HOST=db \
    MYSQL_ROOT_PASSWORD=root
COPY run.sh /run.sh
RUN mkdir -p /etc/sentora
VOLUME [ "/etc/sentora" ]
ENTRYPOINT [ "/bin/sh","/run.sh" ]
EXPOSE 80
CMD ["apache2-foreground"]