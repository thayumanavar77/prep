import re
n=int(raw_input())
str=''
for i in xrange(0,n):
  str+=raw_input()
e=re.findall(r'https?://(?:www\.|ww2\.)?((?:[A-Za-z0-9]+\.)+[A-Za-z0-9]+)',str)
print ';'.join(sorted(set(e))) 

