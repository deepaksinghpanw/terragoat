# File: Dockerfile
# Use a full Ubuntu 20.04 base image.
FROM ubuntu:20.04

# Set non-interactive mode for apt-get to prevent it from prompting
ENV DEBIAN_FRONTEND=noninteractive

# Update apt and install Python 3.8 and pip
RUN apt-get update && \
    apt-get install -y python3.8 python3-pip
 
# Copy the application files
WORKDIR /app
COPY . .

# Install Flask (using pip3)
# --- FIX for PEP 668 ---
# Add --break-system-packages to override the "externally-managed-environment"
# error. This is safe to do inside a self-contained Docker image.
RUN pip3 install flask==1.0.0 --break-system-packages

# Set the command to run the app (using python3)
CMD ["python3", "app.py"]
