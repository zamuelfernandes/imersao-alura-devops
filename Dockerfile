# 1. Use an official Python runtime as a parent image.
FROM python:3.13.4-alpine3.22

# 2. Set the working directory in the container
WORKDIR /app

# 3. Copy the dependencies file and install them
# This is done in a separate step to leverage Docker's layer caching.
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt

# 4. Copy the rest of the application's code into the container
COPY . .

# 5. Expose the port the app runs on
EXPOSE 8000

# 6. Define the command to run the application for production
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
