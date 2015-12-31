FROM ruby:2.2.4
MAINTAINER Marco Carvalho <marco.carvalho.swasthya@gmail.com>
ENV RAILS_ENV=production
WORKDIR /usr/src/app/

RUN apt-get update && apt-get install -qq -y software-properties-common nginx nodejs postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
ADD https://gist.githubusercontent.com/marcocarvalho/fa7cc7c4e3c490a05c58/raw/b3a12e41f5f1a2235555c27cb26a5ff29b731a0f/unicorn-default-app.conf /etc/nginx/sites-enabled/default
RUN service nginx restart

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install --deployment
RUN update-rc.d nginx defaults

COPY . /usr/src/app

# RUN ["bundle", "exec", "rake", "assets:precompile"]

EXPOSE 80
# CMD ["service", "nginx", "restart"]
CMD ["bundle", "exec", "rake", "db:create", "db:migrate"]
CMD ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]