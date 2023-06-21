# rust_api

## Run

```shell
docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 --rm -d postgres
echo DATABASE_URL=postgres://postgres:postgres@localhost/rust_api > .env
diesel setup
diesel migration run
cargo run
```

or use docker-compose

```shell
docker-compose up --build
```

## Query

```shell
# Create document
curl -X POST -H "Content-Type: application/json" -d '{"title": "Attention is all you need", "url": "https://arxiv.org/abs/1706.03762"}' http://localhost:8081/documents
# Query all documents
curl http://localhost:8081/documents
```
