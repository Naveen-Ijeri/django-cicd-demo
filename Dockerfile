# Use an official Python runtime as base image
FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Prevents Python from writing .pyc files and buffering stdout
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . /app/

# Run Django server
CMD ["gunicorn", "core.wsgi:application", "--bind", "0.0.0.0:8000"]