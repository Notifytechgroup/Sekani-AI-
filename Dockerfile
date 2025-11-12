FROM n8nio/n8n:latest

USER root

# Set working directory
WORKDIR /home/node/.n8n

# Copy workflow file
COPY ./workflows /home/node/.n8n/workflows

# Set permissions
RUN chown -R node:node /home/node/.n8n

USER node

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]