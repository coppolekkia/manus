# (Lascia la riga FROM originale che hai all'inizio, ad es. FROM python:3.12-slim)

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

# 3. COMANDO FONDAMENTALE: Non usare "bash". 
# Usa il comando che avvia realmente il bot (verifica se si chiama main.py o in un altro modo)
CMD ["python", "main.py"]
