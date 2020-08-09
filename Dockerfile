FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn npm

RUN npm install -g yarn
RUN yarn install --check-files

RUN mkdir /alpha-blog
WORKDIR /alpha-blog
COPY Gemfile /alpha-blog/Gemfile
COPY Gemfile.lock /alpha-blog/Gemfile.lock
RUN bundle install

COPY . /alpha-blog

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
