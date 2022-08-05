FROM python:3.8-slim-bullseye

RUN apt-get update -y \
  && apt-get install libgl1-mesa-dev libgl1-mesa-glx xvfb -y --no-install-recommends \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*
RUN pip install vedo && rm -rf $(pip cache dir)

# create user and own directories
# RUN groupadd -r algorithm && useradd -m --no-log-init -r -g algorithm algorithm
RUN groupadd -r --gid 1002 hostuser
RUN adduser --disabled-password --gecos "" --force-badname --gid 1002 hostuser
RUN mkdir -p /app /app/data 
RUN chown hostuser:hostuser /app /app/data

# USER algorithm
WORKDIR /app/

COPY test.py save_screenshot.py set_xvfb.sh /app/

RUN chmod a+x /app/set_xvfb.sh
ENTRYPOINT ["/app/set_xvfb.sh"]