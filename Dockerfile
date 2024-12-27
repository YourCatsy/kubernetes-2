# Базовый образ с Ruby
FROM ruby:3.1

# Установка системных зависимостей
RUN apt-get update -qq && apt-get install -y \
    build-essential libpq-dev nodejs yarn postgresql-client

# Установка рабочей директории
WORKDIR /app

# Копирование файлов для установки зависимостей
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4

# Копирование оставшихся файлов приложения
COPY . .

# Предварительная компиляция ассетов (если есть фронтенд)
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Открытие порта
EXPOSE 80

# Команда для запуска приложения
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "80"]
