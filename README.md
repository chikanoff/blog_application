```bash
cp .env.sample .env

docker-compose build
docker-compose run --rm web rake db:create
docker-compose run --rm web rake db:migrate
docker-compose up
```
