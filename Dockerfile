FROM ruby:3.0

RUN apt-get update \
    && apt-get install -y \
    postgresql-client \
    vim

RUN bundle config --global frozen 1

WORKDIR /bilinho

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
