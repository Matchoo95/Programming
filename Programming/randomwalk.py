#get the inputs (numWalks and numSteps)
#simulate numWalks random walks of numSteps step each
#display the average distance from start point

from random import random

def main():
    numWalks, numSteps = getInputs()
    averageSteps = takeWalks(numWalks, numSteps)
    printExpectedDistance(averageSteps)
    
def getInputs():
    numWalks = eval(input("How many random walks to take? "))
    numSteps = eval(input("How many steps for each walk? "))
    return numWalks, numSteps
    
#totalSteps = 0
#loop numWalks times:
#   simulate a walk of numSteps steps
#   totalSteps = totalSteps + steps away
#return totalSteps / numWalks

def takeWalks(numWalks, numSteps):
    totalSteps = 0
    for walk in range(numWalks):
        stepsAway = takeAWalk(numSteps)
        totalSteps = totalSteps + stepsAway
    return totalSteps / numWalks
    
def printExpectedDistance(averageSteps):
    print("The expected number of steps away from the", end=" ")
    print("Start point is", averageSteps)
    
def takeAWalk(numSteps):
    stepsForwardOfStart = 0
    for step in range(numSteps):
        if random() < 0.5:
            stepsForwardOfStart = stepsForwardOfStart - 1
        else:
            stepsForwardOfStart = stepsForwardOfStart + 1
        return abs(stepsForwardOfStart)
main()

