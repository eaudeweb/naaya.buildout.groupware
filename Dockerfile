from eaudeweb/naayaos:17.10.27-py27

ENV ZOPE_HOME /var/local/groupware
WORKDIR $ZOPE_HOME

COPY bootstrap.py $ZOPE_HOME/
COPY buildout.cfg $ZOPE_HOME/
COPY naaya.cfg $ZOPE_HOME/
COPY sources.cfg $ZOPE_HOME/
COPY versions.cfg $ZOPE_HOME/
COPY zope-2.12.28-versions.cfg $ZOPE_HOME/
COPY docker-entrypoint.sh /

RUN python2.7 ./bootstrap.py --version=1.4.4 \
 && bin/buildout
