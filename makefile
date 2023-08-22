SCRIPT_VERSION=v1.0
SCRIPT_AUTHOR=theld21

update:
	@docker-compose exec api php artisan migrate
	@docker-compose exec api php artisan optimize:clear
	@docker-compose exec api php artisan cache:clear
	@docker-compose exec api php artisan queue:restart
	
queue:
	@docker-compose exec api php artisan queue:restart
	@docker-compose exec api php artisan queue:work
