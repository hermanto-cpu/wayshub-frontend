FROM node:13-alpine

WORKDIR /home/wayshub

# Install tiny tools (netcat for health check)
RUN apk add --no-cache netcat-openbsd

# Copy app from builder
COPY --from=builder /home/wayshub /home/wayshub

# Install only pm2 (for runtime)
RUN npm install -g pm2@3.5.1

# Copy entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 5000

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
