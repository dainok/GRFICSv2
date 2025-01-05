Build with:

```
docker build -t dainok/grficsv2-simulation:latest .
```

Run with:

```
docker run --name plc --rm -d -p 80:6080 -p 5020:5020 -p 5021:5021 -p 5022:5022 -p 5023:5023 -p 5024:5024 -p 5025:5025 dainok/grficsv2-simulation:latest
```

Debug with:

```
docker run --name plc --rm -it --entrypoint=/bin/bash -p 80:6080 -p 5020:5020 -p 5021:5021 -p 5022:5022 -p 5023:5023 -p 5024:5024 -p 5025:5025 dainok/grficsv2-simulation:latest
```

Publish with:

```
docker login --username=dainok
docker push dainok/grficsv2-simulation:latest
```
