FROM hjacobs/nikola

ADD .ssh /.ssh
ADD git_ssh /
ADD run.sh /

ADD pequod.xml /

EXPOSE 8000

ENTRYPOINT ["/run.sh"]


