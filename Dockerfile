FROM node:24.21.0-alpine
LABEL "repository"="https://github.com/anothrNick/github-tag-action"
LABEL "homepage"="https://github.com/anothrNick/github-tag-action"
LABEL "maintainer"="Nick Sjostrom"

# node:24.21.0 ships npm 11. npm 12 is the first version that blocks dependency
# install scripts, so pin it before installing semver.
RUN apk --no-cache add bash git git-lfs curl jq \
  && npm install -g --ignore-scripts npm@12.1.0 \
  && npm --version \
  && npm install -g semver

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
