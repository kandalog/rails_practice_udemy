FROM ruby:3.2.2

WORKDIR /myapp

COPY Gemfile* /myapp/

RUN gem update --system && \
    bundle install

COPY . /myapp

# You ought health check in yml if you wanted to wait building database
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]