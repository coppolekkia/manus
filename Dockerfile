FROM python:3.12-slim

WORKDIR /app

# 1. Installa i compilatori e gli strumenti di sistema necessari
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . .

# 2. Installa le librerie Python
RUN pip install --no-cache-dir -r requirements.txt

# 3. Avvia il progetto
CMD ["python", "main.py"]
