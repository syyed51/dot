#!/bin/bash
# add 'fstab' file to load NTFS drives

echo "this script will add readability options in /etc/fstab file."
echo "You will have to remove the file manually, if no longer needed"
echo "-------NTFS Reader---------"
echo "___________________________"
df -h
echo "___________________________"
echo -n "NTFS drive name from above >"
read LABEL

echo "LABEL=$LABEL none ntfs rw,auto,nobrowse" > /etc/fstab

echo "done..."
