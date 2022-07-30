set -e
cp /app/README.md /var/data/README.md
cp /app/service.py /var/data/service.py
# Create services and start running them.
pm2 start "python /var/data/service.py /var/data" --watch /var/data --restart-delay=10000 --name="generate files"
pm2 start "http-server /var/data -p 80 --cors='*'"
pm2 save
# The final command is to keep the container running by streaming
# the logs.
pm2 logs
