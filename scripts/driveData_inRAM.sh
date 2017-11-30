#! /bin/bash
#Here’s a tip I picked up last night at our local Cocoaheads meeting: if you have a lot of RAM in your machine and a decent chunk of it is not currently in use, create a RAM disk and mount it at ~/Library/Developer/Xcode/DerivedData.

drive=$(hdid -nomount ram://4194304)

if [ $drive != 0 ]
then
echo "Your RAM drive: $drive"
newfs_hfs -v DerivedData $drive
diskutil mount -mountPoint ~/Library/Developer/Xcode/DerivedData $drive
echo
echo
echo "Remember to clean before you build next time"
echo "Happy coding...!"
else
     echo "RAM disk creation failed"   
fi

tdrives=$(diskutil list | grep '/*2.1 GB' | wc -l)
echo
echo "Note: You have $tdrives mount points of size 2.1 GB"

#Notes
#Some notes:
#1. The number in the hdid command is the size of the RAM disk, in 512 byte sectors. 4194304 is a 2 GB volume.
#2. hdid outputs the device name of the RAM disk. Use the number in place of the N in the newfs_hfs and diskutil commands, and take special note of the rdisk device in newfs_hfs.
#3. Mounting a volume on top of your existing DerivedData hides the old files. They continue to take up space, but are unreachable until you unmount the RAM disk.
#4. The contents of the RAM disk disappear when you reboot or eject it from the Finder. Xcode will need to rebuild its indexes and all of your project’s intermediate files the next time you create one.


#References:
# http://lightyearsoftware.com/2012/08/use-a-ram-disk-for-deriveddata/
