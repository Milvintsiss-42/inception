CONFIG	= -f ./srcs/docker-compose.yml

all: up

up:
	docker compose ${CONFIG} up -d
down:
	docker compose ${CONFIG} down

build:
	docker compose ${CONFIG} build
fresh_build:
	docker compose ${CONFIG} build --no-cache

clean:
	docker compose ${CONFIG} down -v

fclean:
	docker compose ${CONFIG} down -v --rmi all

.PHONY: all up down build fresh_build clean fclean