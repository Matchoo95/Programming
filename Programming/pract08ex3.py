from random import random

def main():
    numWalks, numSteps = getInputs()
    averageSteps = takeWalks(numWalks, numSteps)
    distanceBetweenPoints(distanceBetween)
    printExpectedDistance(averageSteps)
    
def getInputs():
    numWalks = eval(input("How many random walks to take? "))
    numSteps = eval(input("How many steps for each walk? "))
    return numWalks, numSteps

#this function needs changing
def takeWalks(numWalks, numSteps):
    totalSteps = 0
    for walk in range(numWalks):
        stepsAway = takeAWalk(numSteps)
        totalSteps = totalSteps + stepsAway
    return totalSteps / numWalks
    
def distanceBetweenPoints(stepsHorizontal, stepsVertical):
    finalDistance = Point(stepsHorizontal, stepsVertical)
    centre = Point(0, 0)
    distanceBetween = finalDistance - centre
    
    return distanceBetween
    
def printExpectedDistance(distanceBetween):
    print("The distance from the start is ", distanceBetween)
    
def takeAWalk(numSteps):
    stepsHorizontal = 0
    stepsVertical = 0
    for step in range(numSteps):
        if random() < 0.2:
            stepsHorizontal = stepsHorizontal - 1
            stepsVertical = stepsVertical - 1
        elif random() >= 0.2 and random() <= 0.4:
            stepsHorizontal = stepsHorizontal + 1
            stepsVertical = stepsVertical - 1
        elif random() >= 0.4 and random() <= 0.6:
            stepsHorizontal = stepsHorizontal - 1
            stepsVertical = stepsVertical + 1
        else:
            stepsHorizontal = stepsHorizontal + 1
            stepsVertical = stepsVertical + 1
            
        return (stepsHorizontal, stepsVertical)
main()