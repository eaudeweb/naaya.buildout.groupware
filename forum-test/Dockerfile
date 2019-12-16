from eeacms/groupware:groupware-19.12.16

ENV ZOPE_HOME /var/local/groupware
WORKDIR $ZOPE_HOME

COPY buildout.cfg $ZOPE_HOME/
COPY crontab.cfg $ZOPE_HOME/
COPY sources.cfg $ZOPE_HOME/
COPY versions.cfg $ZOPE_HOME/

RUN mkdir -p src && cd src && git clone https://github.com/eaudeweb/naaya.git && cd .. \
 && bin/buildout \
 && mkdir -p $ZOPE_HOME/var/log \
 && touch $ZOPE_HOME/var/log/instance.log \
 && touch $ZOPE_HOME/var/log/instance-Z2.log \
 && touch $ZOPE_HOME/var/log/zeoserver.log \
 && chown zope:zope -R .

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
