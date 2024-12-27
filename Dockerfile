# Используем базовый образ для Ruby
FROM ruby:3.1

# Устанавливаем зависимости
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем Gemfile и Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Устанавливаем гемы
RUN bundle install

# Копируем всё приложение
COPY . .

# Открываем порт 80
EXPOSE 80

# Устанавливаем команду запуска приложения
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "80"]
