import random
import string



def generate():
    my_word = string.printable
    word_length =int(input("Enter size of password: "))
    if (word_length < 8):
        print("This size of password will be weak!")
        generate()
    else:
        p = "".join(random.sample(my_word,word_length))

    print(p)


generate()
