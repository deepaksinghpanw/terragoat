# File: Dockerfile
# Use a full Ubuntu 20.04 base image. This is not "slim" and will 
# contain the full OS package database (/var/lib/dpkg) that 
# the Cortex scanner needs to read.
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
RUN pip3 install flask==1.0.0

# Set the command to run the app (using python3)
CMD ["python3", "app.py"]
