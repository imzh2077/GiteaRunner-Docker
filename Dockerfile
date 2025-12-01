FROM ubuntu:noble

RUN apt-get update \
  && apt-get install -y curl dumb-init git git-lfs htop locales lsb-release man-db nano openssh-client procps sudo vim-tiny wget zsh \
  && git lfs install \
  && rm -rf /var/lib/apt/lists/* \
  && wget -P /usr/local/bin/act_runner https://dl.gitea.com/act_runner/0.2.13/act_runner-0.2.13-linux-arm64

CMD ["/usr/local/bin/act_runner deamon"]
