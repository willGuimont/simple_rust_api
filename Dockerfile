FROM rust:latest AS build
WORKDIR /app
COPY . .
RUN --mount=type=cache,target=/home/root/.cargo \
    --mount=type=cache,target=/app/target/release/deps \
    cargo build --release

FROM rust:latest

WORKDIR /app
COPY --from=build /app/target/release/simple_rust_api ./simple_rust_api
ENV DATABASE_URL=postgres://postgres:postgres@db
CMD sleep 5; ./simple_rust_api
