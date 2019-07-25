#!/bin/python3
#https://www.hackerrank.com/challenges/frequency-queries/problem
import math
import os
import random
import re
import sys

# Complete the freqQuery function below.
def freqQuery(queries):
  d = dict()
  freqCount = dict()
  output = []

  for q in queries:
    op = q[0]
    num = q[1]
    if op == 3:
      result = freqCount.get(num, 0)
      if result > 0:
        output.append(1)
      else:
        output.append(0)
    elif op == 1:
      prev = d.get(num,0)
      d[num] = prev + 1
      if prev > 0:
        freqCount[prev] = freqCount[prev] - 1
      freqCount[prev + 1] = freqCount.get(prev + 1, 0) + 1 
    elif op == 2:
      prev = d.get(num, 0)
      if prev > 0:
        d[num] = prev - 1
        freq = prev - 1
        if freq > 0:
          freqCount[freq] = freqCount.get(freq, 0) + 1
        freqCount[prev] = freqCount[prev] - 1  
  return output

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    q = int(input().strip())

    queries = []

    for _ in range(q):
        queries.append(list(map(int, input().rstrip().split())))

    ans = freqQuery(queries)

    fptr.write('\n'.join(map(str, ans)))
    fptr.write('\n')

    fptr.close()

