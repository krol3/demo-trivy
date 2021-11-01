FROM alpine:latest
COPY --from=goreleaser/goreleaser:v0.183.0 /usr/local/bin/ /my