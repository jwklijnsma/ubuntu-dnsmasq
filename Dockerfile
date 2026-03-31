# Use Ubuntu 24.04 LTS as base image
FROM ubuntu:24.04

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install dnsmasq
RUN apt-get update && \
    apt-get install -y dnsmasq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose DNS ports
EXPOSE 53/udp
EXPOSE 53/tcp

# Run dnsmasq in foreground (required for Docker)
CMD ["dnsmasq", "-k"]
