import re
n=int(raw_input())
str=''
for e in xrange(0,n):
    str+=raw_input()+' '
e=re.findall(r'\w+@\w+\.\w+',str)
print ';'.join(sorted(set(e)))
