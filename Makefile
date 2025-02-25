run-app-with-setup:
	docker compose build
	docker compose up -d
	docker exec backend /bin/sh -c "composer install --no-dev --optimize-autoloader && chmod -R 777 storage && php artisan key:generate"

run-app-with-setup-db:
	docker compose build
	docker compose up -d
	docker exec backend /bin/sh -c "composer install --no-dev --optimize-autoloader && chmod -R 775 storage && php artisan key:generate && php artisan migrate:fresh --seed"
	docker exec frontend /bin/sh -c "npm install && npm run build"

run-app:
	docker compose up -d

kill-app:
	docker compose down

enter-nginx-container:
	docker exec -it nginx /bin/sh

enter-backend-container:
	docker exec -it backend /bin/sh

enter-frontend-container:
	docker exec -it frontend /bin/sh

enter-mysql-container:
	docker exec -it mysql /bin/sh

flush-db:
	docker exec backend /bin/sh -c "php artisan migrate:fresh"

flush-db-with-seeding:
	docker exec backend /bin/sh -c "php artisan migrate:fresh --seed"

code-format-check:
	docker exec backend /bin/sh -c "npm run format:check"

code-format:
	docker exec backend /bin/sh -c "npm run format"

code-test:
	docker exec backend /bin/sh -c "php artisan test"