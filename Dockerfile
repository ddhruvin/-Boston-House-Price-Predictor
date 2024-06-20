# FROM python:3.10
# COPY . /app
# WORKDIR /app
# RUN pip install -r requirements.txt
# EXPOSE $PORT
# CMD ["python", "app.py"]
# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt requirements.txt

# Install the dependencies specified in the requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port that the Flask app runs on
EXPOSE 5000

# Specify the command to run the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]