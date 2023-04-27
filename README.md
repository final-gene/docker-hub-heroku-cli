# Heroku CLI

[![Docker build and publish](https://github.com/final-gene/docker-hub-heroku-cli/actions/workflows/publish.yml/badge.svg)](https://github.com/final-gene/docker-hub-heroku-cli/actions/workflows/publish.yml)

This is an image to run the [heroku cli](https://devcenter.heroku.com/categories/command-line).

## How to use this image
Run the `heroku-cli` image:

```bash
docker run \
    --rm \
    --interactive \
    --tty \
    --volume "$(pwd)":/app \
    finalgene/heroku-cli
```

Mount the .netrc-file into the container to use the interactive login.

```bash
docker run \
    --rm \
    --interactive \
    --tty \
    --volume ~/.cache/heroku:/root/.cache/heroku \
    --volume ~/.local/share/heroku:/root/.local/share/heroku \
    --volume ~/.netrc:/root/.netrc \
    --volume "$(pwd)":/app \
    finalgene/heroku-cli login
```

You can use any of the heroku cli commands

```bash
docker run \
    --rm \
    --interactive \
    --tty \
    --volume ~/.cache/heroku:/root/.cache/heroku \
    --volume ~/.local/share/heroku:/root/.local/share/heroku \
    --volume ~/.netrc:/root/.netrc \
    --volume "$(pwd)":/app \
    finalgene/heroku-cli help
```

For further information take a look at the [heroku command documentation](https://devcenter.heroku.com/articles/heroku-cli-commands).

## Quick reference
* **Where to get help:**
[the Docker Community Forums](https://forums.docker.com), [the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack), or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)

* **Where to file issues:**
https://github.com/final-gene/docker-hub-heroku-cli/issues

* **Maintained by:**
[The final gene Team](https://github.com/final-gene)

* **Source of this description:**
[Repository README.md](https://github.com/final-gene/docker-hub-heroku-cli/blob/master/README.md)
