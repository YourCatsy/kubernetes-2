# Базовый образ с Ruby
FROM ruby:3.3.6

# Установка системных зависимостей
RUN apt-get update -qq && apt-get install -y \
    build-essential libpq-dev nodejs yarn postgresql-client

# Установка правильной версии bundler
RUN gem install bundler -v 2.4.20

# Установка рабочей директории
WORKDIR /app

# Копирование файлов для установки зависимостей
COPY Gemfile Gemfile.lock ./ 
RUN bundle install --jobs 4

# Установка переменной SECRET_KEY_BASE
ENV SECRET_KEY_BASE=ad18306f7cab93f7159242ba0cb255aa41fcc43d1dfd9a5d9467d160df8fbb2044e9cb2c78c89a08bd1bd294ec459805af6994fcb8b77106e80cda181caa1250

# Копирование оставшихся файлов приложения
COPY . .

# Попробуйте снова с командой rake
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace

# Открытие порта
EXPOSE 80

# Команда для запуска приложения
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "80"]
