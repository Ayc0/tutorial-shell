text = ''

with open("./file.txt") as file:
    text = file.read()

with open("./file2.txt", "w") as file:
    file.write(text)
