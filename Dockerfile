FROM "node:13-alpine"

RUN ["/bin/mkdir", "-p", "/usr/src/app"]
RUN ["/bin/chown", "-R", "node:node", "/usr/src/app"]
RUN ["/sbin/apk", "add", "bash", "git", "openssh-client"]
WORKDIR /home/node
COPY --chown=node:node ssh_known_hosts /home/node/.ssh/known_hosts
RUN ["/bin/chmod", "-R", "0700", ".ssh"]
VOLUME "/usr/src/app"
USER node

COPY package.json yarn.lock ./
RUN ["yarn"]

COPY index.mjs .

USER root
COPY --chown=root:node on-push.sh ./
RUN ["/bin/chmod", "0554", "./on-push.sh"]

# for local debugging
#COPY --chown=node:node deploy_rsa /home/node/.ssh/id_rsa

USER node
CMD ["index.mjs"]
