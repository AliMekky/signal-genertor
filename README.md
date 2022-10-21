# Backup Shell script

#### Overview : 
Automated shell script that checks a certain directory every 1 minute and if it was
updated, it copies the new version named by current date to a backup directory
specified by the user.
*************************************************************************
#### Inputs :
1. Source directory : It is the directory that the shell script will backup.
2. Backup directory : The folder that will contain the copies.
3. Max number of backups : The max number of recent copies saved in the backup directory.
************************************************************************
#### Procedures : 


##### Shell Script :
1. It takes the inputs passed by the user.
2. decalring the needed variables : current date and counter.
3. it checks if the back up directory is empty then it copies the first copy and creates directory-info.last.
4. it counts the current number of backup directories created to assure that it did not exceed the maximum number.
5. check if there is any updates in the source file : 
by creating directory-info.new of the last modification time of source files then 
comparing it to directory-info.last, if they are not equal then it will update
the directory-info.last and copies a new version to the backup directory.
6. It checks the number of backups if it exceeded the maximum number specified ,
it will delete the oldest backup.

****************************************************************************
#### User Manual : 
1. by creating the cron job it is automated.
2. to create the cron jon, open the terminal :
~ crontab -e
inside the crontab : 
*/1 * * * * /bin/sh Path/backup-cron.sh src_directory dest_directory max_backups > out.txt
***************************************************************************
#### Additional info: 
considering that * * * * * --> minutes hours days months week_days respectively 
to run the backup every 3rd friday of the month at 12:31 am : 
*/31 12 15-21 * 5 /bin/sh Path/backup-cron.sh src_directory dest_directory max_backups >> out.txt

as week days starts from 0 for sunday, and possible days for the 3rd friday between 15 and 21 from every month.
