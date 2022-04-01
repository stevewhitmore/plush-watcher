FROM python:3.10.3-bullseye

WORKDIR /app

COPY . .
RUN python -m pip install -r requirements.txt

# Install Cron
RUN apt-get update && \
    apt-get install -y cron vim mutt && \
    mv /app/.muttrc /root

# Set timezone
ENV TZ="America/Chicago"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN crontab -l | { cat; echo '0 12 * * * cd /app/src && ./run.sh'; } | crontab -

CMD cron && tail -f /dev/null
