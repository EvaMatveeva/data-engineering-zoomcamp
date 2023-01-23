## Homework 1
### Question 1. Knowing docker tags
```bash
(de_env) Evas-MacBook-Pro:~ eva$ docker build --help

Usage:  docker build [OPTIONS] PATH | URL | -

Build an image from a Dockerfile

Options:
...
      --iidfile string          Write the image ID to the file
...
```
### Question 2. Understanding docker first run
```bash
(base) Evas-MacBook-Pro:docker eva$ docker build -t test:python .

(base) Evas-MacBook-Pro:docker eva$ docker run -it test:python

root@270d230d337c:/# pip list
Package    Version`
---
pip        22.0.4
setuptools 58.1.0
wheel      0.38.4
```
