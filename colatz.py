#task in automate boring stuff

def cyclic(number):
    if number % 2 == 0:
        if number // 2 == 1:
            print(1)
        else:
            print(number//2)
            cyclic(number // 2)
    else:
        print((number * 3) + 1)
        cyclic((number * 3) + 1)


print("Enter a number:")
try:
    n = int(input())
    cyclic(n)
except ValueError:
    print("Unvalied value")
