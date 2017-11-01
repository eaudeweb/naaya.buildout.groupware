from eaudeweb/naayaos:17.11.01-py27

ENV ZOPE_HOME /var/local/groupware
WORKDIR $ZOPE_HOME

COPY bootstrap.py $ZOPE_HOME/
COPY buildout.cfg $ZOPE_HOME/
COPY naaya.cfg $ZOPE_HOME/
COPY sources.cfg $ZOPE_HOME/
COPY versions.cfg $ZOPE_HOME/
COPY zope-2.12.28-versions.cfg $ZOPE_HOME/
COPY docker-entrypoint.sh /

RUN wget https://bootstrap.pypa.io/get-pip.py \
 && python2.7 ./get-pip.py setuptools==7.0 \
 && rm -r ./get-pip.py \
 && python2.7 ./bootstrap.py --version=1.4.4 \
 && bin/buildout
