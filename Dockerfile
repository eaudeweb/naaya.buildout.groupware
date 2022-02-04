FROM eaudeweb/naayaos:20220204-py27-slim

ENV ZOPE_HOME /var/local/groupware
WORKDIR $ZOPE_HOME

COPY buildout.cfg $ZOPE_HOME/
COPY naaya.cfg $ZOPE_HOME/
COPY sources.cfg $ZOPE_HOME/
COPY versions.cfg $ZOPE_HOME/
COPY docker-entrypoint.sh /

RUN curl https://raw.githubusercontent.com/eaudeweb/naaya/master/buildout/Naaya/zope-2.13.29-versions.cfg > zope-2.13.29-versions.cfg \
 && wget https://bootstrap.pypa.io/pip/2.7/get-pip.py \
 && python2.7 ./get-pip.py setuptools \
 && rm -r ./get-pip.py \
 && virtualenv --python=python2 . \
 && . bin/activate \
 && pip install zc.buildout \
 && buildout
