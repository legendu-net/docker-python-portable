# NAME: dclong/python-portable
FROM dclong/base
# GIT: https://github.com/legendu-net/docker-base.git

COPY scripts/ /scripts/
ARG url=https://github.com/indygreg/python-build-standalone/releases/download/20220528/cpython-3.10.4+20220528-x86_64-unknown-linux-gnu-pgo+lto-full.tar.zst
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
