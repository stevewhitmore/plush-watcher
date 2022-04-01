# Plush Watcher

This project exists because my kid REALLY likes the Warriors book series and the publisher sells swag. One of the things they sell are plushy cat doll things that sell like hot cakes and are nearly always out of stock. This little project crawls their website and alerts me when one is found to be in stock.

1. Add a `.muttrc` file to the root directory of this project for the email notifications. Information on sending files via Google SMTP can be found [here](https://gitlab.com/stevewhitmore/notes/-/blob/master/linux/gmail-smtp-bash.md). This project has no prebuilt image since this file has sensitive information.
2. From the root directory of this project run `docker build -t plush-img .` to build the image. There is no prebuilt image available to pull because it needs files with sensitive information that is custom per user.
3. Run `docker run -d -v $(pwd)/logs:/app/logs --env EMAIL=<some email> --rm --name plush-watcher plush-img` to run the container (assuming you want to capture the log output on the host machine). You shouldn't need to expose any ports since there's no need to interact with the container.
4. If needed, you can SSH into the container with `docker exec -it wp-update-scanner /bin/bash` to adjust things without having to rebuild the image.

### Requirements

You must provide an `EMAIL` environment variable.

* Docker

OR

* Python v3.10.3
* Bash
    * mutt
    * cron
