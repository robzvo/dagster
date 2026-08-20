#!/bin/sh

# Ensure the .ssh directory exists
mkdir -p .ssh
chmod 700 .ssh

# Write the environment variable to the file
if [ -n "$SNOWFLAKE_SSH_PRIVATE_KEY" ]; then
    echo "$SNOWFLAKE_SSH_PRIVATE_KEY" > .ssh/snowflake
    chmod 600 .ssh/snowflake
fi

# Optional: Add your target server to known_hosts to prevent interactive prompts
# ssh-keyscan github.com >> /root/.ssh/known_hosts

# Unset the variable so it isn't visible in env dumps
unset SNOWFLAKE_SSH_PRIVATE_KEY

# Execute the container's main command (passed via CMD)
exec "$@"
