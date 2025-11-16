# File: Dockerfile
# Use a full Ubuntu 20.04 base image.
FROM ubuntu:20.04

# Set non-interactive mode for apt-get to prevent it from prompting
ENV DEBIAN_FRONTEND=noninteractive

# --- FIX ---
# The Cortex CLI scanner log shows it is looking for a 'status.d' directory
# inside /var/lib/dpkg. This directory doesn't exist by default on ubuntu:20.04.
# This non-standard check causes the scanner to fail, leading to an
# "invalid verdict" and a 500 Internal Server Error.
# Creating this empty directory satisfies the scanner's requirement.
RUN mkdir -p /var/lib/dpkg/status.d
# --- END FIX ---

# Update apt and install Python 3.8 and pip
RUN apt-get update && \
    apt-get install -y python3.8 python3-pip
 
# Copy the application files
WORKDIR /app
COPY . .

# Install Flask (using pip3)
RUN pip3 install flask==1.0.0

# Set the command to run the app (using python3)
CMD ["python3", "app.py"]
