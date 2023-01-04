FROM alpine:3.16.2


# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && \
    ln -sf python3 /usr/bin/python && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools

COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
EXPOSE 8421
CMD ["/usr/bin/python", "web.py"]
