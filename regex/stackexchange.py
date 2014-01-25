import sys
import re
str=sys.stdin.readlines()
t=''.join(str)
for e in re.findall(r'<div class="summary">.*?<a href="/questions/(.*?)/.*?>(.*?)</a>.*?class="relativetime">(.*?)</span>',t, re.DOTALL):
  print ';'.join(e)
