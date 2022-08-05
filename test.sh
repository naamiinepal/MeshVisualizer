docker build -t vedo-test-local .
docker run --rm -v output:/app/data vedo-test-local python test.py

# docker save vedo-test-local:latest | gzip -c > vedo_latestv3Aug.tar.gz