import re
n=int(raw_input())
for i in xrange(0,n):
  str=raw_input()
  t=re.match(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?))$',str)
  if t != None:
    print "IPv4"
  else:
    t=re.match(r'^(?:(?:[0-9a-f]){1,4}\:){7}(?:(?:[0-9a-f]){4})', str)
    if t != None:
      print "IPv6"
    else:
      print "Neither"


