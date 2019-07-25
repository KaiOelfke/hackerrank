#!/bin/python3
#https://www.hackerrank.com/challenges/ctci-recursive-staircase/problem
import math
import os
import random
import re
import sys

# Complete the stepPerms function below.
def stepPerms(n):
  if n == 9:
    return 149
  if n == 10:
    return 274
  if n == 11:
    return 504
  if n == 12:
    return 927
  if n == 13:
    return 1705
  if n == 4:
    return 7
  if n == 5:
    return 13
  if n == 6:
    return 24
  if n == 7:
    return 44
  if n == 8:
    return 81
  if n == 3:
    return 4
  if n == 2:
    return 2
  if n == 1:
    return 1
  return (stepPerms(n-3) + stepPerms(n-2) + stepPerms(n-1)) 

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = int(input())

    for s_itr in range(s):
        n = int(input())

        res = stepPerms(n)

        fptr.write(str(res) + '\n')

    fptr.close()

