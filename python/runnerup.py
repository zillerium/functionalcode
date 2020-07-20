if __name__ == '__main__':
    n = int(input())
    arr = map(int, input().split())
    max=0
    runnerup=0
    i=0
    for x in arr:
        if i == 0:
            max = x
            i = 1
        else:
            if x > max:
                runnerup = max
                max = x
            else:
                if i == 1 and x < max:
                    runnerup = x
                    i = 2
                else:
                    if x > runnerup and x < max:
                        runnerup = x
                        i = 2
    print(runnerup)
