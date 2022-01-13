# Run rclone sync periodically in docker

Dockerized version of [rclone](https://rclone.org/) used to run periodic sync's with lernsax and our google drive.

Inspired by [https://github.com/traum-ferienwohnungen/docker-rclone](https://github.com/traum-ferienwohnungen/docker-rclone)


## Usage

Use the image as if you would run `rclone sync` direcly and it will re-run your `rclone` command every 5 minutes, use the environment variable `SYNC_INTERVAL_SECONDS` to modify the intervall or set it to `0` to make `rclone` run only once.

For example:
```bash
docker run -e SYNC_INTERVAL_SECONDS=10 \
  -v ~/.config/rclone/rclone.conf/:~/.config/rclone/rclone.conf \
  --name lernsync \
  herodev/docker-lernsync \
  copy lernsax: "lerndrive:/Lernglossar/Lernsax Mirror/" -P --exclude="b.heichel@bsz7.lernsax.de/" --check-first --error-on-no-transfer
```
