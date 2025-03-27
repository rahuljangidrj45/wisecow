FROM debian:bookworm-slim

WORKDIR /app

# Install required dependencies
RUN apt-get update && apt-get install -y \
    cowsay \
    fortunes \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Copy the script to the container
COPY wisecow.sh .

# Make the script executable
RUN chmod +x ./wisecow.sh

# Ensure dependencies are available in PATH
ENV PATH="/usr/games:$PATH"

# Expose the required port
EXPOSE 4499

# Run the script
CMD ["./wisecow.sh"]
