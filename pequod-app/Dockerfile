FROM hjacobs/nikola

RUN pip3 install CherryPy==3.6.0

ADD .ssh /.ssh
ADD git_ssh /
ADD run.sh /
ADD serve.py /

ADD pequod.xml /

EXPOSE 8000

ENTRYPOINT ["/run.sh"]


