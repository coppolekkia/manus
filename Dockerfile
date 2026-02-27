FROM python:3.10

WORKDIR /app

COPY . .

# 1. Installiamo 'uv', l'installatore ultra-veloce e leggero
RUN pip install uv

# 2. Usiamo 'uv' al posto di pip per installare i pacchetti. 
# Essendo velocissimo e leggero sulla RAM, dovrebbe ingannare i limiti di Hostinger
RUN uv pip install --system --prerelease=allow -r requirements.txt

# 3. Installiamo i browser per OpenManus
RUN playwright install --with-deps chromium

# 4. Avvia il progetto
CMD ["python", "main.py"]
