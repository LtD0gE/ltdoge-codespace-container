#!/bin/bash

# Codespace Keepalive Patcher by LtD0gE

sed -i '/$@/d' /home/codespace/.vscode-remote/bin/*/server.sh
sed -i '/$@/d' /home/codespace/.vscode-remote/bin/*/bin/code-server
sed -i '/$@/d' /home/codespace/.vscode-remote/bin/*/bin/remote-cli/code
# remove all startup commands

cat << EOF | tee -a /home/codespace/.vscode-remote/bin/*/server.sh
NewArgs=''
for args in "$@";
do
    if [ "$args" != "--enable-remote-auto-shutdown" ];
    then
        NewArgs="$NewArgs $args"
    fi
done
"$ROOT/node" ${INSPECT:-} "$ROOT/out/server-main.js" --compatibility=1.63 "$NewArgs"
EOF
cat << EOF | tee -a /home/codespace/.vscode-remote/bin/*/bin/code-server
NewArgs=''
for args in "$@";
do
    if [ "$args" != "--enable-remote-auto-shutdown" ];
    then
        NewArgs="$NewArgs $args"
    fi
done
"$ROOT/node" ${INSPECT:-} "$ROOT/out/server-main.js" --compatibility=1.63 "$NewArgs"
EOF
# The two above do the same job.
# We will take remote-cli/code separately.

cat << EOF | tee -a /home/codespace/.vscode-remote/bin/*/bin/remote-cli/code
NewArgs=''
for args in "$@";
do
    if [ "$args" != "--enable-remote-auto-shutdown" ];
    then
        NewArgs="$NewArgs $args"
    fi
done
"$ROOT/node" "$CLI_SCRIPT" "$APP_NAME" "$VERSION" "$COMMIT" "$EXEC_NAME" "$NewArgs"
EOF
# all jobs done, vscode-remote may run indefinitely now.
