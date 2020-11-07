# NAME: dclong/python-portable
FROM dclong/ubuntu_b
# GIT: https://github.com/dclong/docker-ubuntu_b.git

ARG url=https://github.com/indygreg/python-build-standalone/releases/download/20201020/cpython-3.8.6-x86_64-unknown-linux-gnu-pgo-20201020T0627.tar.zst
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        zstd \
    && curl -sSL $url -o /tmp/cpython.tar.zst \
    && tar -I zstd -xvf /tmp/cpython.tar.zst -C /tmp/ \
    && mv /tmp/python/install /opt/python \
    && rm -rf /tmp/* \
    && apt-get autoremove \
    && apt-get clean
