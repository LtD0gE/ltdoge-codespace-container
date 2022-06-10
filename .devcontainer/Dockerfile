FROM mcr.microsoft.com/vscode/devcontainers/universal:1-linux

# ** [Optional] Uncomment this section to install additional packages. **
# USER root
#
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
#
USER codespace

#Here we will make the codespace running indefinitely.
COPY indef.sh /tmp/scripts/indef.sh
RUN chmod 777 /tmp/scripts/indef.sh && bash /tmp/scripts/indef.sh