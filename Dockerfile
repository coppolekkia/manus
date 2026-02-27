# 1. Usiamo l'immagine ufficiale di Playwright (basata su Ubuntu) che ha già tutte le dipendenze di sistema risolte, con Python preinstallato.
FROM mcr.microsoft.com/playwright/python:v1.42.0-jammy

WORKDIR /app

COPY . .

# 2. Installiamo 'uv' per la velocità
RUN pip install uv

# 3. Installiamo i pacchetti del progetto
RUN uv pip install --system --prerelease=allow -r requirements.txt

# 4. Installiamo i browser di Playwright (le dipendenze di sistema ci sono già!)
RUN playwright install chromium

# 5. Avvia il progetto
CMD ["python", "main.py"]
