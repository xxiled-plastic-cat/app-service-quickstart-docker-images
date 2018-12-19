#!/bin/sh

while [ 1 ]
do     
    test ! -e $NGINX_LOG_DIR/access.log && touch $NGINX_LOG_DIR/access.log && chmod 666 $NGINX_LOG_DIR/access.log
    test ! -e $NGINX_LOG_DIR/error.log && touch $NGINX_LOG_DIR/error.log && chmod 666 $NGINX_LOG_DIR/error.log
    test ! -e $NGINX_LOG_DIR/php-error.log && touch $NGINX_LOG_DIR/php-error.log && chmod 666 $NGINX_LOG_DIR/php-error.log
    test ! -d "/home/LogFiles/olddir" && echo "INFO: folder for backup log files not found. creating..." && mkdir -p "/home/LogFiles/olddir"
    test ! -d "/usr/local/php/tmp" && echo "INFO: Session folder for php not found. creating..." && mkdir -p "/usr/local/php/tmp" && chmod 777 /usr/local/php/tmp
    if [ ! $WEBSITES_ENABLE_APP_SERVICE_STORAGE ]; then
        echo "INFO: NOT in Azure, chown for $NGINX_LOG_DIR"  
        chown -R nginx:nginx $NGINX_LOG_DIR
        chown -R nginx:nginx /home/LogFiles/olddir 
    fi
    sleep 3s
done 
