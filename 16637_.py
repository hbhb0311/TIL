import sys
input = sys.stdin.readline

n = int(input())
form = input()

def calc(sub):
    temp = str(eval(sub[:3]))
    l = len(sub)
    for i in range(3, l, 2):
        temp = str(eval(temp + sub[i:i+2]))
    return temp


for i in range(0, n - 2, 2):
    pre = calc(form[ :i-1])
    post = calc(form[i+4: ])
    mid = str(eval(form[i:i+3]))
    ans = calc(pre+form[i-1]+mid+form[i+3]+post)
    print(ans)

