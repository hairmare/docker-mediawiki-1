#!/bin/bash
set -e

if [ -f /usr/local/share/ca-certificates/ca.crt ]; then
    update-ca-certificates
fi

if [ ! -f ./extensions/SemanticMediaWiki/.smw.json ]; then
    php maintenance/update.php --skip-external-dependencies --quick
fi

exec apache2-foreground -DFOREGROUND "$@"
