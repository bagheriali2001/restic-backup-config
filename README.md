# restic-backup-config

Run the below commands in order:

To install restic:
`sh install.sh`

Copy the `.env.example` file and complete it with your own env (Please refer to the table below for more info):
`cp .env.example restic.env`

To make the `.env` file has restricted permissions and prevent unauthorized access:
`chmod 600 restic.env`

To make the file executable:
`chmod +x init-restic.sh`

To initialize the repository:
`RESTIC_HOME_DIR="$HOME/path/to/this/repo" init-restic.sh`

To make the file executable:
`chmod +x backup-restic.sh`

To add the cronjob to crontab:
`crontab -e`

and add the following line with your own time configuration (You can use [Crontab Guru](https://crontab.guru/))

`0 */4 * * * RESTIC_HOME_DIR="$HOME/path/to/this/repo" $HOME/path/to/this/repo/backup-restic.sh >> /var/log/backup-restic.log 2>&1`

**Note**: It is best to run the following time at the first time of backup and then add the cronjob (For larger repositories): `RESTIC_HOME_DIR="$HOME/path/to/this/repo" backup-restic.sh`

## ENV Info

| ENV | Info |
|----------|----------|
| `RESTIC_HOME_DIR`    | Home Directory of this repo   |
| `AWS_ACCESS_KEY_ID`    | Access key of S3 Object Storage   |
| `AWS_SECRET_ACCESS_KEY`    | Secret key of S3 Object Storage   |
| `RESTIC_REPOSITORY`    | Address if S3 Object Storage Bucket (and Folder if you have other data in that Bucket). Note that you should add a `s3:` before the address   |
| `RESTIC_PASSWORD`    | A secure password for this repository   |
| `RESTIC_CACHE_DIR`    | A directory for restic to store metadata cache   |
| `UPLOAD_BANDWIDTH_LIMIT`    | To limit the upload bandwidth of restic backup, used when you don't want restic to use all of the server bandwidth. In `KiB/s`   |
| `BACKUP_PATH`    | Path to the data you want to backup   |
| `KEEP_LAST`    | Tells restic that how many snapshots it should keep   |
