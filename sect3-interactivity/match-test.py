import os

while True:
    # Enter in user choice, lowercase, and first spot
    choice = input("Choose a, b, c, or q...").lower()[0]

    # Look for the match
    match choice:
        case 'a':
            print("A")
        case 'b':
            print("B")
        case 'c':
            print("C")
        case 'q':
            os._exit(status=1)
        case _:
            print("Unknown")
