docker build -t vedo-test-local .
inputdir=$(readlink -f output)
echo "writing a test output to ${inputdir}"
docker run --rm -v $inputdir:/app/data vedo-test-local python test.py 1> /dev/null 2> /dev/null

# docker save vedo-test-local:latest | gzip -c > vedo_latestv3Aug.tar.gz