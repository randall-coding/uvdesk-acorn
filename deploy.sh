#!/bin/bash
acorn build -t ghcr.io/randall-coding/acorn/uvdesk && \
acorn push ghcr.io/randall-coding/acorn/uvdesk && \
acorn run -s uvdesk-mariadb:uvdesk-mariadb -n uvdesk --memory=1Gi ghcr.io/randall-coding/acorn/uvdesk
