FROM python:3.12.15-alpine3.24

ENV ANSIBLE_VER=9.13.0
ENV ANSIBLE_CORE_VER=2.16.19
ENV EASZLAB_ANSIBLE_TAG=2.16.19

RUN apk --no-cache add \
        bash \
        openssh-client \
        rsync

RUN pip install --no-cache-dir --only-binary=:all: \
        ansible=="$ANSIBLE_VER" \
        ansible-core==2.16.19 \
       # Some module need '/usr/bin/python' exist
    && ln -s -f /usr/local/bin/python3 /usr/bin/python \
    && ln -s -f /usr/local/bin/python3 /usr/bin/python3 \
       # Cleaning
    && rm -rf /root/.cache

CMD [ "sleep", "360000000" ]
