import random

length = random.randint(50, 80)  # 生成随机长度
chars = ['0', 'O']
str = "O"

for _ in range(length):
    random_char = random.choice(chars)
    str += random_char

print(str)
