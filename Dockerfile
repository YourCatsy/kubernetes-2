# Используем базовый образ Ruby
FROM ruby:3.1

# Устанавливаем необходимые пакеты
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем Gemfile и Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Устанавливаем зависимости
RUN bundle install

# Копируем весь проект в контейнер
COPY . .

# Указываем порт, на котором приложение будет работать
EXPOSE 3000

# Команда запуска приложения
CMD ["rails", "server", "-b", "0.0.0.0"]
