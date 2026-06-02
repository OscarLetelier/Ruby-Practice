FROM ruby:3.3.11

# La imagen completa ya trae build-essential y libyaml-dev. 
# Solo necesitamos agregar las cabeceras de PostgreSQL.
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    libpq-dev \
    git \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Instalamos Rails globalmente en el contenedor
RUN gem install rails

