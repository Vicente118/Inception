COMPOSE = srcs/docker-compose.yml

all: up

up:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker-compose -f $(COMPOSE) up --build -d
	docker ps

prune:
	docker system prune -af

down:
	docker-compose -f $(COMPOSE) down -v

fclean: down
	sudo rm -rf /home/vdarras/data

re: fclean all

