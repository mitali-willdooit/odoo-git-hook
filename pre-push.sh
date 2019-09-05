#!/bin/sh

# An example hook script to verify what is about to be pushed.  Called by "git
# push" after it has checked the remote status, but before anything has been
# pushed.  If this script exits with a non-zero status nothing will be pushed.
#
# This hook is called with the following parameters:
#
# $1 -- Name of the remote to which the push is being done
# $2 -- URL to which the push is being done
# LICENSE is the path of your Enterprice LICENSE file.
#
# This code shows how to prevent the push when user pushing the code with wrong remote.

remote="$1"
url="$2"
if grep -q "Odoo Enterprise Edition License" LICENSE | [[ "$url" == "https://github.com/odoo-dev/enterprise.git" || "$url" == "git@github.com:odoo-dev/enterprise.git" ]]; then
    exit 0
else
    echo "Could not push enterprise code in community repository.r"
    exit 1
fi
exit 0
