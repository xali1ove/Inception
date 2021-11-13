DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yaml

start:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up
down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down
re:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up --build
stop:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) stop
clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q)

.PHONY: start down stop
