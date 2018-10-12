FROM ruby:2.5
RUN bundle config --global frozen 1
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && \
    apt-get install -y --allow-unauthenticated nodejs \
                                               curl \
                                               bash \
                                               binutils \
                                               tar \
                                               gnupg \
                                               yarn

RUN mkdir -p /gems/ruby/2.5.0
ENV BUNDLE_PATH=/gems/ruby/2.5.0

WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle config --delete frozen
RUN bundle install

COPY . .

EXPOSE 3000
ENV RAILS_ENV=development

CMD ["bundle", "exec", "rails", "server"]
