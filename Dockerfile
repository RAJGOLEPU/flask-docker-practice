FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies first (helps Docker cache efficiently)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Expose port for Gunicorn
EXPOSE 5000

# Run the app using Gunicorn (production WSGI server)
CMD ["gunicorn", "--workers=4", "--bind=0.0.0.0:5000", "app:app"]
