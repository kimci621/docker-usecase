# В каком окружении будет контейнер
FROM node

# Рабочая дираектория контейнера
WORKDIR /app

# Копируем package.json для оптимизации, чтобы docker проверял свой кэш и не проводил npm install при следующем создании контейнера
COPY package*.json /app

# Команды необходимые для запуска приложения
RUN npm install

# Копируем все что получилось в рабочую дираекторию
COPY . /app

# Сохраняем env переменную с именем CUSTOM_PORT (использовать с $ - $variable)
ENV CUSTOM_PORT 3000

# Указываем порт контейнера
EXPOSE $CUSTOM_PORT

# "Папка" докера в которой можно хранить данные
VOLUME [ "/app/data" ]

# Команада для запуска приложения
CMD [ "npm", "run", "start" ]

# C:\Users\Amir\Desktop\docker-test\node-logger\logs-app\Dockerfile

# docker build -t image_name . - создание образа
# docker run -d -p pc_port:docker_port image_name/id:tag_name - создать контейнер
# docker run -d -p pc_port:docker_port --rm --name custom_container_name image_name/id:tag_name - создать контейнер который удалится после использования и с кастомный именем
# !!! docker_port должен быть такой же как и $CUSTOM_PORT
# docker start container_name/id - запустить контейнер
# docker stop container_name/id - остановить контейнер
# docker ps / ps -a - показать все контейнеры / неактивные
# docker images / image ls - показать все образы
# docker rmi image_name/id - удалить контейнер
# docker tag old_image_name new_image_name - переименовать образ
# docker image prune - удалить все неактивные образы
# docker rm container_name/id - удалить контейнер
# docker container prune - удалить все неактивные контейнеры
# docker rename old_container_name new_container_name - переименовать контейнер
# docker logs container_name/id - логи контейнера
# docker attach container_name/id - открыть контейнер в терминале
# volumes - папка д окера в которой можно сохранять данные
# Для того чтобы использовать volume в образе, надо указать его в run команде (-v volume_name:some/dir)
# docker run -d -p pc_port:docker_port -v volume_name:app/data --name custom_container_name image_name/id:tag_name
# docker volume ls - список volumes
# docker volume rm volume_name / docker volume prune - удаление volumes
# Для разработки, можно указать всю директорию(/app) и node_modules в volumes в run
# docker run -p 3000:3000 -d --rm --name container_name -v data:/app/data -v /app/node_modules -v "C:/Users/Amir/Desktop/docker-test/node-logger/logs-app:/app" image_name

# https://docs.docker.com/engine/reference/run/