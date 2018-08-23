#!/usr/bin/env sh

ENTRYPOINT_COMMAND=heroku
NO_CMD=1

# Check for binary if first arg doesn't starts with `-`
if [ "${1}" != "" -a "${1:0:1}" != "-" ]; then
    which $1 > /dev/null
    NO_CMD=$?
fi

# Run given command if the first arg matches the entry point command
if [ "$1" = "${ENTRYPOINT_COMMAND}" ]; then
  set -- "$@"
# Pass all arguments to the entry point command
elif [ ${NO_CMD} -eq 1 ]; then
  set -- ${ENTRYPOINT_COMMAND} "$@"
fi

# Run the command
exec "$@"
