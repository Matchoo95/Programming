from random import randint

def main():
    noOfFlips = getInputs()
    heads, tails = calculateFlips(noOfFlips)
    outputResults(heads, tails)


def getInputs():
    noOfFlips = eval(input("How many times do you want to flip the coin? "))
    
    return noOfFlips
    
    
def calculateFlips(noOfFlips):
    heads = 0
    tails = 0
    for i in range(noOfFlips):
        if randint(1, 2) == 1:
            heads = heads + 1    
        else:
            tails = tails + 1
    
    return heads, tails
    
def outputResults(heads, tails):
    print("Heads ", heads / 100, "Tails ", tails / 100)

main()