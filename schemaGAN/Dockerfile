FROM tensorflow/tensorflow:2.17.0-gpu

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the models and utils folders into the working directory
COPY models /app/models
COPY utils /app/utils

# Set the PYTHONPATH to include the app directory
ENV PYTHONPATH "${PYTHONPATH}:/app"

# Run the schemaGAN script
CMD ["python", "/app/models/schemaGAN3.py"]
