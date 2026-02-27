# Usiamo Python 3.10: la versione più stabile e compatibile per i progetti AI
FROM python:3.10

WORKDIR /app

COPY . .

# Aggiorniamo pip
RUN pip install --upgrade pip

# Installiamo con un timeout allungato per evitare interruzioni di rete
RUN pip install --no-cache-dir --default-timeout=100 -r requirements.txt

# Installiamo i browser per OpenManus
RUN playwright install --with-deps chromium

# Avvio del progetto
CMD ["python", "main.py"]
