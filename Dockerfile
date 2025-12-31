FROM n8nio/n8n:latest

USER root

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    python3 \
    python3-pip \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install yt-dlp
RUN pip3 install -U yt-dlp

# Install Whisper
RUN pip3 install -U openai-whisper torch

# Create temp directory
RUN mkdir -p /tmp && chmod -R 777 /tmp

USER node
