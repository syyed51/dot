#/bin/bash 

declare -a Line
# script to learn/practice dictionary words.
Line[1]="Lithunia"
Line[2]="Estinia"
Line[3]="Or the beauty of innuendoes,"
Line[4]="The blackbird whistling"
Line[5]="Or just after."


for index in 1 2 3 4 5
do
      printf "     %s\n" "${Line[index]}"
      echo ${Line[index]}
done
