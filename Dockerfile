FROM python:3.13-alpine

WORKDIR /app

# Install required Alpine build dependencies
RUN apk add --no-cache \
    build-base \
    libffi-dev \
    gcc \
    musl-dev \
    linux-headers \
    libressl-dev \
    python3-dev \
    py3-pip

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
