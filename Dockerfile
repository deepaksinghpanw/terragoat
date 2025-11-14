# File: Dockerfile
# Use an older, known-vulnerable base image
FROM python:3.7-alpine

WORKDIR /app
COPY . .

# Install an old version of Flask
RUN pip install flask==1.0.0

CMD ["python", "app.py"]
