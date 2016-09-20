from random import randint
from random import random

def tenCoinFlips():
    for i in range(10):
        if randint(1, 2) == 1:
            print("Heads")
        else:
            print("Tails")

def tenDiceRolls():
    for i in range(10):
        print(randint(1, 6))
        
def tenBiasedCoinFlips():
    for i in range(10):
        if random() < 0.85:
            print("Heads")
        else:
            print("Tails")

