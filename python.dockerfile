FROM python:3.6-slim-buster
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget && rm -rf /var/lib/apt/lists/*
# Dumb init
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64
RUN chmod +x /usr/local/bin/dumb-init
RUN pip install --upgrade pip
WORKDIR /usr/src/app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY helloworld.py .
USER 1001
ENTRYPOINT ["/usr/local/bin/dumb-init", "python3", "-u", "./helloworld.py"]
