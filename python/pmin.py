min = 0
runnerup = 0
i = 0
x=[]
for _ in range(int(raw_input())):
    name = raw_input()
    score = float(raw_input())
    x.append(tuple((name, score)))
    if i==0:
        min=score
        i=1
    else:
        if score < min:
     #       print("cond 1 "+name)
            runnerup = min
            min = score
            i=2
        else:
            if i == 1:
                if score > min:
                 ##   print("cond 2 "+name)
                    runnerup = score
                    i =2
                else:
                  ##///  print("cond 5 "+name)
                    i=1
            else:
                if score < runnerup and score > min:
                  ##/  print("cond 3 "+name)
                    runnerup = score
                    i=2
                else:
                    if score == runnerup:
                      ##  print("cond 4 "+name)
                        i=2
            

#print(runnerup)
##print(runnerup)
##print(x)#
y = list(filter(lambda item: item[1]==runnerup, x))
##print(y)
c=[b[0] for b in y]
c.sort()
for kk in c:
    print(kk)

