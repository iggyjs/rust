FROM rust:1.66.1

RUN mkdir -p /home/rust/code

WORKDIR /home/rust/code

RUN cargo new --bin app

WORKDIR /home/rust/code/app

# Copy our manifests
# COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml

# Build only the dependencies to cache them
RUN cargo build --release
RUN rm src/*.rs

COPY ./src ./src

# Build for release.
RUN rm ./target/release/deps/app*
RUN cargo build --release

CMD ["./target/release/app"]
