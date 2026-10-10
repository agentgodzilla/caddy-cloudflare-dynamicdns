ARG CADDY_VERSION

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \ 
    xcaddy build \
      --with github.com/caddy-dns/cloudflare \
      --with github.com/mholt/caddy-dynamicdns

FROM caddy:$CADDY_VERSION

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
