#!/bin/bash
ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("Battery\n_______\n%.2f%%\n\n", $10/$5 * 100)}'
