FROM alpine:3.12.3
RUN adduser -D -g '' appuser
USER appuser
CMD sh -c 'sleep 1d'%
