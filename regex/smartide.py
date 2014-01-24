import sys
import re
str=sys.stdin.readlines()
t=''.join(str)
for e in re.findall(r'//.*?$|/\*.*?\*/',t,re.MULTILINE+re.DOTALL):
  print e
