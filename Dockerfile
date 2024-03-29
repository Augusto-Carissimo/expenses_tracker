FROM ruby:3.2.2-alpine3.18
ENV BUNDLER_VERSION=2.4.13
RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python3 \
      tzdata \
      yarn
RUN gem install bundler -v 2.4.13
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install

COPY . ./
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]