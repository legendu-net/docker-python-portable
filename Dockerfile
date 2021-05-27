# NAME: dclong/python-portable
FROM dclong/ubuntu_b
# GIT: https://github.com/dclong/docker-ubuntu_b.git

COPY scripts/ /scripts/
ARG url=https://github.com/indygreg/python-build-standalone/releases/download/20200822/cpython-3.7.9-x86_64-unknown-linux-gnu-pgo-20200823T0036.tar.zst
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        zstd \
    && curl -sSL $url -o /tmp/cpython.tar.zst \
    && tar -I zstd -xvf /tmp/cpython.tar.zst -C /tmp/ \
    && mv /tmp/python/install /opt/python \
    && /opt/python/bin/python3 -m pip install -U pip \
    && rm -rf /tmp/* \
    && apt-get autoremove \
    && apt-get clean
COPY ssh/config /root/.ssh/
