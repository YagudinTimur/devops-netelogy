# Домашнее задание к занятию "3. Введение. Экосистема. Архитектура. Жизненный цикл Docker контейнера"

# Задание 1

https://hub.docker.com/repository/docker/yagduintr/devops-netology-my-nginx/tags?page=1&ordering=last_updated

# Задание 2

Высоконагруженное монолитное java веб-приложение - так как монолитное веб-приложение физ. сервер либо виртуализация

Nodejs веб-приложение - контейнеризация подойдет для решения задачи.

Мобильное приложение c версиями для Android и iOS - предполагается, что приложение имеет своего потребителя, а значит необходим UI для взаимодействия с пользователем. По моему мнению, корректнее всего использовать виртуализацию с реализацией виртуальной машины.

Шина данных на базе Apache Kafka - лучше контейниризация так просто расширения и меньше накладных ресурсов.

Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana - для упомянутых продуктов есть контейнеры на docker hub. Из-за простоты управления и сборки контейнеров, мне кажется необходимо распихать продукты по контейнерам и на основании контейнеров собрать кластер стека ELK. 

Мониторинг-стек на базе Prometheus и Grafana - по моему мнению также как и пример с ELK, скорее всего с течением времени будут вноситься изменения в систему мониторинга и не один раз, будут добавляется метрики, так как точки мониторинга будут меняться - добавляться новый функционал, было бы не плохо применить IaaC в том числе и в этом случае - мониторинг как код, контейнеризация помогает этого добиться.

MongoDB, как основное хранилище данных для java-приложения - либо виртуализация, либо контейнеризация, все зависит от реализации архитектуры приложения. Сложно дать вразумительный ответ - никогда не работал с данной БД, затрудняюсь обосновать выбор. Чувствую, что так будет правильно.

Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry - виртуализация или физический сервер.

# Задание 3

Запустим первый контейнер с Centos 

![image](https://user-images.githubusercontent.com/42189764/215279014-341bbf9d-5fd1-470e-9b17-f447c7826434.png)


Запустим второй контейнер с debian

![image](https://user-images.githubusercontent.com/42189764/215279075-c2f5bd79-9bcc-4177-8398-5b75f60b063d.png)

Зайдем в контейнер и создадим файл

![image](https://user-images.githubusercontent.com/42189764/215279153-bd161814-d7cb-4957-9ee3-5c4cc46906f4.png)

Создадим файл на хостовой машине в директории /data и подключимся ко второму контейнеру

![image](https://user-images.githubusercontent.com/42189764/215279260-bdf8b12d-9150-4e55-9d89-abdb8a80667e.png)
