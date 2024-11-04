FROM caddy:builder AS 2.8.4-builder

RUN caddy-builder \
    github.com/caddy-dns/cloudflare

FROM caddy:2.8.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
