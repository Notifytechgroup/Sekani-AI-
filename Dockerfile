FROM n8nio/n8n:latest

USER root

# Set working directory
WORKDIR /home/node

# Copy workflow file if it exists
COPY --chown=node:node ./workflows /home/node/.n8n/workflows

# Set proper permissions
RUN chown -R node:node /home/node/.n8n && \
    chmod -R 755 /home/node/.n8n

USER node

# Expose port
EXPOSE 5678

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Start n8n with full path
CMD ["/usr/local/bin/n8n", "start"]