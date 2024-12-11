COMPOSE = srcs/docker-compose.yml

all:
	docker-compose -f $(COMPOSE) up --build -d

clean:
	docker-compose -f $(COMPOSE) down -v

fclean: clean
	rm -rf srcs/requirements/mariadb/db_data srcs/requirements/wordpress/wordpress_data

re: fclean all

