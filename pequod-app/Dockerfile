FROM hjacobs/nikola

RUN pip3 install CherryPy==3.6.0

ADD run.sh /
ADD serve.py /

EXPOSE 8000

ENTRYPOINT ["/run.sh"]


