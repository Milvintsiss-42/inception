CONFIG	= -f ./srcs/docker-compose.yml

all: up

up:
	@mkdir -p /home/$(USER)/data/wp_files
	@mkdir -p /home/$(USER)/data/wp_data
	docker compose ${CONFIG} up -d
down:
	docker compose ${CONFIG} down
restart: down up

build:
	docker compose ${CONFIG} build
fresh_build:
	docker compose ${CONFIG} build --no-cache

clean:
	docker compose ${CONFIG} down -v

fclean:
	docker compose ${CONFIG} down -v --rmi all

.PHONY: all up down restart build fresh_build clean fclean
