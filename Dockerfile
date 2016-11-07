from eaudeweb/naayaos

ENV ZOPE_HOME /var/local/groupware

COPY bootstrap.py $ZOPE_HOME/
COPY naaya.cfg $ZOPE_HOME/
COPY sources.cfg $ZOPE_HOME/
COPY versions.cfg $ZOPE_HOME/
COPY zope-2.12.28-versions.cfg $ZOPE_HOME/
COPY docker-entrypoint.sh /
