FROM ubuntu

RUN apt-get update && apt-get install --no-install-recommends -y postgresql-client-9.4 python-pip curl && \
    pip install awscli && \
    apt-get clean \
    rm -rf /var/lib/apt/lists/*

ADD . /code
WORKDIR /code

ENV AWS_ACCESS_KEY_ID **None**
ENV AWS_SECRET_ACCESS_KEY **None**
ENV AWS_BUCKET **None**

CMD /bin/bash -c "tail -f /dev/null"