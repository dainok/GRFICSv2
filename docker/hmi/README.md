Build with:

```
docker build -t dainok/grficsv2-hmi:latest .
```

Run with:

```
docker run --name hmi --rm -d -p 80:6080 dainok/grficsv2-hmi:latest
```

Use username `admin` with password `admin` to access the HMI. Manually update the data source pointing to the PLC.

Debug with:

```
docker run --name hmi --rm -it --entrypoint=/bin/bash -p 80:6080 dainok/grficsv2-hmi:latest
```

Publish with:

```
docker login --username=dainok
docker push dainok/grficsv2-hmi:latest
```
