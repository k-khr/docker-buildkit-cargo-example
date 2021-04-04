# syntax = docker/dockerfile:1.2
FROM rust:alpine AS builder
WORKDIR /rust
RUN apk --no-cache add musl-dev
COPY ./Cargo.toml ./Cargo.lock .
COPY ../src/ ./src/
RUN --mount=type=cache,target=/usr/local/cargo/registry \
  --mount=type=cache,target=/rust/target \
  cargo build --release &&\
  cp /rust/target/release/test /rust/test

FROM busybox
WORKDIR /work
COPY --from=builder /rust/test .
CMD ["test"]
