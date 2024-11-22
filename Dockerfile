FROM python:3.9-slim

WORKDIR /var/www/html

# Copy all files to /var/www/html
COPY . /var/www/html

# Create a new directory for the flag
RUN mkdir /var/www/html/ system_flag

# Copy flag.txt into the new directory
COPY flag.txt /var/www/system_flag/

# Install dependencies
RUN pip install --no-cache-dir -r metadata/requirements.txt

# Expose port 80
EXPOSE 80

# Run the Flask app
CMD ["python3", "app.py"]

