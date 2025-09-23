FROM plone/plone:4.3.19

USER root
RUN apt-get update && apt-get install -y --no-install-recommends git sudo && rm -rf /var/lib/apt/lists/*
RUN git clone --depth=1 https://github.com/cynin/cynin.git /opt/cynin
WORKDIR /opt/cynin
RUN python bootstrap.py && ./bin/buildout -c buildout.cfg

EXPOSE 8080
CMD ["/opt/cynin/bin/instance", "console"]
