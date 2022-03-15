FROM ruby:2.7.5

# node.jsと必要なライブラリのインストール
RUN apt-get update -qq && apt-get install -y \
      build-essential \
      libpq-dev \
      nodejs \
      postgresql-client \
      curl && \
    rm -rf /var/lib/apt/lists/*

# ディレクトリ・ファイルの作成
RUN mkdir /web-bff
ENV APP_ROOT /web-bff
WORKDIR $APP_ROOT
COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

# gemのインストール
RUN bundle install
COPY . $APP_ROOT