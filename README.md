# Run rclone sync periodically in docker

Dockerized version of [rclone](https://rclone.org/) used to run periodic sync's with lernsax and our google drive.

Inspired by [https://github.com/traum-ferienwohnungen/docker-rclone](https://github.com/traum-ferienwohnungen/docker-rclone)


## Usage

Use the image as if you would run `rclone sync` direcly and it will re-run your `rclone` command every 5 minutes, use the environment variable `SYNC_INTERVAL_SECONDS` to modify the intervall or set it to `0` to make `rclone` run only once.

For example:
```bash
docker run -e SYNC_INTERVAL_SECONDS=10 \
  -v /gcs-serviceaccount.json:/gcs-serviceaccount.json:ro \
  -v /tmp/foo/:/tmp/foo/ \
  --name rclone \
  traumfewo/docker-rclone \
  --gcs-service-account-file /gcs-serviceaccount.json sync :gcs:BUCKET-NAME/BUCKET-DIR/ /tmp/foo/
```
