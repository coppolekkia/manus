# Usiamo la versione completa di Python (senza "-slim"), che ha già git e tutti i compilatori
FROM python:3.12

WORKDIR /app

COPY . .

# 1. Aggiorniamo pip all'ultima versione (evita molti bug di compatibilità)
RUN pip install --upgrade pip

# 2. Installiamo le librerie del progetto
RUN pip install --no-cache-dir -r requirements.txt

# 3. Installiamo i browser necessari a OpenManus per navigare su internet
RUN playwright install --with-deps chromium

# 4. Avvia il progetto
CMD ["python", "main.py"]
