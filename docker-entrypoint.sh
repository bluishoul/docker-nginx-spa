#!/bin/sh

if [[ $CONFIG_VARS ]]; then
  SPLIT=$(echo $CONFIG_VARS | tr "," "\n")
  for VAR in ${SPLIT}; do
      VAL=$(eval "echo \"\$$VAR\"")
      sed -i "s/window\.${VAR} = \'\'/window.${VAR} = '${VAL}'/g" /app/index.html
  done
fi

exec "$@"
