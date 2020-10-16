
def listToString(alist2):
    alist = [str(x) for x in alist2]
    s = ''
    for i in range(len(alist)):
        if i != len(alist)-1:
            s += alist[i] + ", "
        else:
            s += "and " + alist[i]
    print(s)
