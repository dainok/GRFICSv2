Build with:

```
docker build -t dainok/grficsv2-plc:latest .
```

Run with:

```
docker run --name plc --rm -d -p 502:502 -p 80:8080 -e SIM=192.168.1.1 dainok/grficsv2-plc:latest
```

Debug with:

```
docker run --name plc --rm -it --entrypoint=/bin/bash -p 502:502 -p 80:8080 -e SIM=192.168.1.1 dainok/grficsv2-plc:latest
```

Publish with:

```
docker login --username=dainok
docker push dainok/grficsv2-plc:latest
```
