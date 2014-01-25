import re
n=int(raw_input())
for i in xrange(0,n):
  str=raw_input()
  t=re.match(r'^\([-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)\)$',str)
  if t is not None:
    print "Valid"
  else:
    print "Invalid"
