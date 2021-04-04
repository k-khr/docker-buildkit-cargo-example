# docker-buildkit-cargo-example

This is the minimal example of the Docker multi-stage build with BuildKit caching.

## Usage

1. first build
```
$ DOCKER_BUILDKIT=1 docker build .
[+] Building 51.7s (17/17) FINISHED
...
```

2. modify `src/main.rs` like
```diff
7c7
<     println!("{}", y);
---
>     // println!("{}", y);
```

3. second build
```
$ DOCKER_BUILDKIT=1 docker build .
[+] Building 5.5s (17/17) FINISHED
...
```

The build time was reduced by 89%: `51.7s` -> `5.5s`
