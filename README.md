# restic-backup-config

Run the below commands in order:

To install restic:
`$HOME/path/to/this/repo/install.sh`

To make the `.env` file has restricted permissions and prevent unauthorized access:
`chmod 600 restic.env`

To make the file executable:
`chmod +x $HOME/path/to/this/repo/init-restic.sh`

To initialize the repository:
`$HOME/path/to/this/repo/init-restic.sh`

To make the file executable:
`chmod +x $HOME/path/to/this/repo/backup-restic.sh`

To add the cronjob to crontab:
`crontab -e`

and add the following line with your own time configuration (You can use [Crontab Guru](https://crontab.guru/))

`0 */4 * * * RESTIC_HOME_DIR="$HOME/path/to/this/repo" $HOME/path/to/this/repo/backup-restic.sh >> /var/log/backup-restic.log 2>&1`

It is best to run the following time at the first time of backup and then add the cronjob (For larger repositories): `$HOME/path/to/this/repo/backup-restic.sh`