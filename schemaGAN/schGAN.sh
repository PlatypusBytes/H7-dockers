#!/bin/bash

#SBATCH --exclusive
#SBATCH --job-name=schGAN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=fabian.campos@deltares.nl
#SBATCH --partition=gpu
#SBATCH -w p-lcfgpu002

#SBATCH --output=schgan_%j.log    # Standard output and error log

echo "STARTING $(date)"

# Check Docker version
echo "Checking Docker version..."
docker --version

# Step 1: Build the Docker image
echo "Building Docker image..."
docker build -t tf_image .

# Step 2: Run the Docker container with GPU support
echo "Running Docker container..."

# Run command to point at data in unix folder
docker run --rm --gpus all \
            -v /u/camposmo/schgan/train:/app/train \
            -v /u/camposmo/schgan/test:/app/test \
            -v /u/camposmo/schgan/output:/app/output \
            tf_image

echo "ENDED $(date)"

exit 0
