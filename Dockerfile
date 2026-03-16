FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    curl build-essential libssl-dev libpcre2-dev pkg-config \
    libargon2-dev libsodium-dev libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /home/ircd ircd
USER ircd

ARG UNREALIRCD_URL
RUN curl -fsSL "$UNREALIRCD_URL" -o /tmp/unrealircd.tar.gz && \
    tar -xzf /tmp/unrealircd.tar.gz -C /tmp && \
    cd /tmp/unrealircd-* && \
    ./Config -nointro && \
    make && make install && \
    rm -rf /tmp/unrealircd*
WORKDIR /home/ircd/unrealircd

EXPOSE 6667 6697 8067

CMD ["./unrealircd", "-F"]
