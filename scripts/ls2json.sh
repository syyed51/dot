$ cat ls2json.bash
#!/bin/bash
echo -n '['
for FILE in $(ls -a ~/Desktop | sed -e 's/"/\\"/g')
do
echo -n \"${FILE}\",
done
echo -en \\b']'
