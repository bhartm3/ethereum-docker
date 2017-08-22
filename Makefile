all: build start

check:
	

build:
	docker-compose build

start:
	docker-compose up -d

clean: stop erase

stop:
	docker-compose stop

erase:
	docker network rm ethereumdocker_app_net
	rm -rf /docker-data/ethereum/*

PHONY: build start clean stop
