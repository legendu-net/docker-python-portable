# NAME: dclong/python-portable
FROM dclong/base
# GIT: https://github.com/legendu-net/docker-base.git

COPY scripts/ /scripts/
RUN icon download_github_release -r indygreg/python-build-standalone \
        -k 3.10,x86_64-,unknown,linux,gnu,pgo,lto,full,tar,zst \
        -K debug,sha256 \
        -o /tmp/cpython.tar.zst \
    && apt-get update && apt-get install -y --no-install-recommends \
        zstd \
    && tar -I zstd -xvf /tmp/cpython.tar.zst -C /tmp/ \
    && mv /tmp/python/install /opt/python \
    && /opt/python/bin/python3 -m pip install -U pip \
    && /scripts/sys/purge_cache.sh
COPY ssh/config /root/.ssh/
