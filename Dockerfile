FROM ubuntu:noble

RUN apt-get update \
  && apt-get install -y curl dumb-init git git-lfs htop locales lsb-release man-db nano openssh-client procps sudo vim-tiny wget zsh \
    ca-certificates unzip tar gzip bash make python3 python3-pip build-essential libc6-dev libgcc-s1 tini \
  && git lfs install \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /data && chmod 755 /data

COPY run.sh /usr/local/bin/run.sh
RUN wget -O /usr/local/bin/act_runner https://dl.gitea.com/act_runner/0.2.13/act_runner-0.2.13-linux-arm64 \
  && chmod +x /usr/local/bin/act_runner \
  && chmod +x /usr/local/bin/run.sh

CMD ["/usr/bin/tini", "--", "/usr/local/bin/run.sh"]
