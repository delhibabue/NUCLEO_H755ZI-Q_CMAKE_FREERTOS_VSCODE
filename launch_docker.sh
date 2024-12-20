# MIT License
# 
# Copyright (c) 2024 Delhi Babu Eswaran
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#!/bin/bash

# Set variables for user and paths
USERNAME=$(whoami)                # Host username
USER_UID=$(id -u)                 # Host user ID
USER_GID=$(id -g)                 # Host group ID
CURRENT_DIR=$(pwd)                # Host current working directory
IMAGE_NAME="ubuntu20-user-env"    # Docker image name

# Step 1: Build the Docker image
echo "Building Docker image..."
docker build \
    --build-arg USERNAME=$USERNAME \
    --build-arg USER_UID=$USER_UID \
    --build-arg USER_GID=$USER_GID \
    -t $IMAGE_NAME .

if [ $? -ne 0 ]; then
    echo "Docker image build failed!"
    exit 1
fi
echo "Docker image built successfully."

# Step 2: Run the Docker container
echo "Launching Docker container..."
docker run -it --rm \
    --user $USER_UID:$USER_GID \
    -v $CURRENT_DIR:$CURRENT_DIR \
    -w $CURRENT_DIR \
    $IMAGE_NAME

if [ $? -ne 0 ]; then
    echo "Docker container failed to start!"
    exit 1
fi
echo "Docker container exited successfully."
