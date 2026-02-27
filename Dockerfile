# Usiamo Python 3.12 basato su "Bookworm", la versione Linux preferita da Playwright
FROM python:3.12-bookworm

WORKDIR /app

COPY . .

# 1. Installiamo 'uv' per la velocità
RUN pip install uv

# 2. Installiamo i pacchetti del progetto
RUN uv pip install --system --prerelease=allow -r requirements.txt

# 3. Installiamo i browser e le dipendenze (su Bookworm funzionerà senza errori!)
RUN playwright install --with-deps chromium

# 4. Avvia il progetto
CMD ["python", "main.py"]
