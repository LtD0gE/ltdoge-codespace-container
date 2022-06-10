FROM ubuntu:latest

# ** [Optional] Uncomment this section to install additional packages. **
 USER root
 RUN export DEBIAN_FRONTEND=noninteractive && mkdir /home/codespace && useradd codespace
#
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
#

#Here we will make the codespace running indefinitely.
RUN  bash /tmp/scripts/indef.sh