logrotate测试命令：
     logrotate -d /etc/logrotate.conf 仅测试，不执行操作。

        logrotate -f /etc/logrotate.conf
        logrotate -f /etc/logrotate.d/nginx.logrotate
        logrotate -f /etc/logrotate.d/php.logrotate
        logrotate -f /etc/logrotate.d/mysql.logrotate

原理/etc/cron.daily/logrotate
