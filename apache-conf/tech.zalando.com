<VirtualHost *:80>
    ServerName  tech.zalando.com
    ServerAlias techbeta.zalando.com
    ServerAdmin domain@zalando.de

    DocumentRoot    /data/www/tech.zalando.com/htdocs
    <Location /server-status>
        SetHandler server-status
        Order deny,allow
        Deny from all
        Allow from 127.0.0.1 ::1
    </Location>

    ErrorDocument 404 /pages/error404-not-found.html

    RewriteEngine   On
    RewriteRule ^/feed/     /rss.xml [L,R=permanent]
    RewriteRule ^/platform/    /pages/team.html [L,R=permanent]
    RewriteRule ^/team/    /pages/team.html [L,R=permanent]
    RewriteRule ^/open-source/    /pages/open-source.html [L,R=permanent]
    RewriteRule ^/page/(\d)/    /index-$1.html [L,R=permanent]
    RewriteRule ^/tag/(.*)/    /categories/$1.html [L,R=permanent]

    RewriteRule ^/an-introduction-into-mobile-at-zalando-technology    /posts/an-introduction-into-mobile-at-zalando-technology.html [L,R=permanent]
    RewriteRule ^/a-pms-view-on-building-a-article-component    /posts/a-pms-view-on-building-a-article-component.html [L,R=permanent]
    RewriteRule ^/berlin-welcomes-rwth-aachen-hackathon-winners    /posts/berlin-welcomes-rwth-aachen-hackathon-winners.html [L,R=permanent]
    RewriteRule ^/breaking-up-is-hard-to-do-not-migrating-from-java-6-to-7    /posts/breaking-up-is-hard-to-do-not-migrating-from-java-6-to-7.html [L,R=permanent]
    RewriteRule ^/defeating-the-travelling-salesman-problem-for-warehouse-optimization    /posts/defeating-the-travelling-salesman-problem-for-warehouse-optimization.html [L,R=permanent]
    RewriteRule ^/fast-log-file-analytics-with-python-and-sqlite    /posts/fast-log-file-analytics-with-python-and-sqlite.html [L,R=permanent]
    RewriteRule ^/getting-a-quick-view-of-your-postgresql-stats    /posts/getting-a-quick-view-of-your-postgresql-stats.html [L,R=permanent]
    RewriteRule ^/goto-2013-why-zalando-trusts-in-postgresql    /posts/goto-2013-why-zalando-trusts-in-postgresql.html [L,R=permanent]
    RewriteRule ^/green-or-orange-ab-tests-at-zalando    /posts/green-or-orange-ab-tests-at-zalando.html [L,R=permanent]
    RewriteRule ^/gwt-dev-i    /posts/gwt-dev-i.html [L,R=permanent]
    RewriteRule ^/infusion-zalando-how-to-develop-the-google-way    /posts/infusion-zalando-how-to-develop-the-google-way.html [L,R=permanent]
    RewriteRule ^/introducing-zalo    /posts/introducing-zalo.html [L,R=permanent]
    RewriteRule ^/last-one-out-please-turn-off-the-lights    /posts/last-one-out-please-turn-off-the-lights.html [L,R=permanent]
    RewriteRule ^/managing-zalandos-price-labels    /posts/managing-zalandos-price-labels.html [L,R=permanent]
    RewriteRule ^/mapreduce-how-to-explain-to-your-non-geek-friends    /posts/mapreduce-how-to-explain-to-your-non-geek-friends.html [L,R=permanent]
    RewriteRule ^/meet-the-system-app    /posts/meet-the-system-app.html [L,R=permanent]
    RewriteRule ^/meetup-tech-berlin-cube    /posts/meetup-tech-berlin-cube.html [L,R=permanent]
    RewriteRule ^/monitoring-postgresql-with-pgobserver    /posts/monitoring-postgresql-with-pgobserver.html [L,R=permanent]
    RewriteRule ^/my-three-year-journey-into-zalando-technology    /posts/my-three-year-journey-into-zalando-technology.html [L,R=permanent]
    RewriteRule ^/pgconf-2013-recap-and-slides    /posts/pgconf-2013-recap-and-slides.html [L,R=permanent]
    RewriteRule ^/productcamp-2013    /posts/productcamp-2013.html [L,R=permanent]
    RewriteRule ^/quick-and-simple-zalando-mobile-apps    /posts/quick-and-simple-zalando-mobile-apps.html [L,R=permanent]
    RewriteRule ^/recap-zalando-hosted-java-user-group-dortmund    /posts/recap-zalando-hosted-java-user-group-dortmund.html [L,R=permanent]
    RewriteRule ^/social-shopping-at-zalando-utilizing-the-open-graph-api    /posts/social-shopping-at-zalando-utilizing-the-open-graph-api.html [L,R=permanent]
    RewriteRule ^/task-board-transition    /posts/task-board-transition.html [L,R=permanent]
    RewriteRule ^/team-management-technology-fun-team-retreats    /posts/team-management-technology-fun-team-retreats.html [L,R=permanent]
    RewriteRule ^/technology-meets-tu-ilmenau-development-a-la-club-mate-style    /posts/technology-meets-tu-ilmenau-development-a-la-club-mate-style.html [L,R=permanent]
    RewriteRule ^/techtalks-at-zalando-technology    /posts/techtalks-at-zalando-technology.html [L,R=permanent]
    RewriteRule ^/test-engineering-at-zalando    /posts/test-engineering-at-zalando.html [L,R=permanent]
    RewriteRule ^/thanks-for-your-visit-kit-in-karlsruhe    /posts/thanks-for-your-visit-kit-in-karlsruhe.html [L,R=permanent]
    RewriteRule ^/the-cube-app-announcement    /posts/the-cube-app-announcement.html [L,R=permanent]
    RewriteRule ^/the-evolution-of-zalos-the-story-behind-zalando-logistics    /posts/the-evolution-of-zalos-the-story-behind-zalando-logistics.html [L,R=permanent]
    RewriteRule ^/the-exporter    /posts/the-exporter.html [L,R=permanent]
    RewriteRule ^/the-geeks-are-running    /posts/the-geeks-are-running.html [L,R=permanent]
    RewriteRule ^/the-new-product-detail-page-pdp    /posts/the-new-product-detail-page-pdp.html [L,R=permanent]
    RewriteRule ^/trainee-program-product-management    /posts/trainee-program-product-management.html [L,R=permanent]
    RewriteRule ^/university-project-transparent-inbound-processes-with-fh-lindau    /posts/university-project-transparent-inbound-processes-with-fh-lindau.html [L,R=permanent]
    RewriteRule ^/women-zalando-technology    /posts/women-zalando-technology.html [L,R=permanent]
    RewriteRule ^/writing-python-command-line-scripts    /posts/writing-python-command-line-scripts.html [L,R=permanent]
    RewriteRule ^/zalando-android-app-how-we-managed-it-in-only-eleven-weeks    /posts/zalando-android-app-how-we-managed-it-in-only-eleven-weeks.html [L,R=permanent]
    RewriteRule ^/zalando-android-app-out-now    /posts/zalando-android-app-out-now.html [L,R=permanent]
    RewriteRule ^/zalando-customer-account-check-out-our-new-order-section    /posts/zalando-customer-account-check-out-our-new-order-section.html [L,R=permanent]
    RewriteRule ^/zalando-hack-week    /posts/zalando-hack-week.html [L,R=permanent]
    RewriteRule ^/zalando-mobile-apps-reached-1-mio-downloads    /posts/zalando-mobile-apps-reached-1-mio-downloads.html [L,R=permanent]
    RewriteRule ^/zalando-stored-procedure-wrapper-part-i    /posts/zalando-stored-procedure-wrapper-part-i.html [L,R=permanent]
    RewriteRule ^/zalando-techcrunch-disrupt-europe-2013-hackathon    /posts/zalando-techcrunch-disrupt-europe-2013-hackathon.html [L,R=permanent]
    RewriteRule ^/zalando-tech-kit-career-fair-in-karlsruhe    /posts/zalando-tech-kit-career-fair-in-karlsruhe.html [L,R=permanent]
    RewriteRule ^/zalando-welcomes-java-user-group-dortmund    /posts/zalando-welcomes-java-user-group-dortmund.html [L,R=permanent]
    RewriteRule ^/zooport    /posts/zooport.html [L,R=permanent]

    <Directory /data/www/tech.zalando.com/htdocs>
        Options -Indexes FollowSymLinks -MultiViews
    </Directory>

    ErrorLog /var/log/apache2/tech.zalando.com_error.log

    # Possible values include: debug, info, notice, warn, error, crit,
    # alert, emerg.
    LogLevel warn

    CustomLog /var/log/apache2/tech.zalando.com_access.log combined

</VirtualHost>

