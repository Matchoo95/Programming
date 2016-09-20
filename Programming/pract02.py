# Practical Worksheet 2: Working with Numeric Types
# Matthew Hawkins 769535
# September 2015

import math

#r = radius
#c = circumference
#d = diameter
#a = area

#Diameter = 2 x radius
#Circumference of a circle = pi x diameter = 2 pi x radius
#Area of a circle = pi x r**2

def circumferenceOfCircle():
   r = eval(input("Enter the radius of a circle: "))
   c = 2 * math.pi * r
   print("The circumference is: ", round(c, 2))
circumferenceOfCircle()

def areaOfCircle():
    r = eval(input("Enter the radius of a circle: "))
    a = math.pi * (r**2)
    print("The area is: ", round(a, 2))
areaOfCircle()
    
def costOfPizza():
    d = eval(input("Enter the diameter of a pizza(cm): "))
    r = d / 2
    a = math.pi * (r**2)
    cost = a * 0.015
    print("The cost of the pizza is: ", round(cost, 2))
costOfPizza()

def slopeOfLine():
    #the values stored here are the coordinates that would be seen in the
    #format of (x1,y1) and (x2,y2) when plotting a line
    xOne = eval(input("Enter the x value for the first coordinate: "))
    yOne = eval(input("Enter the y value for the first coordinate: "))
    xTwo = eval(input("Enter the x value for the second coordinate: "))
    yTwo = eval(input("Enter the y value for the second coordinate: "))
    
    #equation for the slope of a line is y2-y1/x2-x1
    slope = (yTwo - yOne) / (xTwo - xOne)
    
    print("The slope of the line is: ", round(slope, 3))
slopeOfLine()

def distanceBetweenPoints():
    #the values stored here are the coordinates that would be seen in the format
    #of (x1,y1) and (x2,y2) when plotting a line
    xOne = eval(input("Enter the x value for the first coordinate: "))
    yOne = eval(input("Enter the y value for the first coordinate: "))
    xTwo = eval(input("Enter the x value for the second coordinate: "))
    yTwo = eval(input("Enter the y value for the second coordinate: "))
    
    #equation to give the distance between two points
    #is sqrt(x2-x1)**2+(y2-y1)**2
    distance = math.sqrt(((xTwo - xOne)**2)+((yTwo - yOne)**2))
    
    print("The distance between the two points is: ", round(distance, 3))
distanceBetweenPoints()
    
def travelStatistics():
    avgSpeed = eval(input("Enter the average speed in km/hour: "))
    durationOfTravel = eval(input("Enter the duration of travel in hours: "))
    
    #distance = speed x time
    distance = avgSpeed * durationOfTravel
    fuel = distance / 5
    print("The distance of the journey is: ", round(distance, 2))
    print("The fuel used during this travel is: ", round(fuel, 2))
travelStatistics()

def sumOfNumbers():
    number = eval(input("Enter a number: "))
    total = 0
    for i in range(number):
        total += i+1
    print(total)
sumOfNumbers()

def averageOfNumbers():
    noOfValues = eval(input("Enter the number of values that you wish to find "\
                            "the average of: "))
    for i in range(noOfValues):
        if i < 1:
            value = eval(input("Enter the first value: "))
        else:
            entry = eval(input("Enter the next value: "))
            value = value + entry
        average = value / noOfValues
    print("The average is: ", average)
averageOfNumbers()

def selectCoins():
    
    amount = eval(input("Enter the amount in pence: "))

    noOf2PCoins = amount // 200
    amount = amount - noOf2PCoins * 200
   
    noOf1PCoins = amount // 100
    amount = amount - noOf1PCoins * 100
      
    noOf50pCoins = amount // 50
    amount = amount - noOf50pCoins * 50
     
    noOf20pCoins = amount // 20
    amount = amount - noOf20pCoins * 20
       
    noOf10pCoins = amount // 10
    amount = amount - noOf10pCoins * 10
 
    noOf5pCoins = amount // 5
    amount = amount - noOf5pCoins * 5
 
    noOf2pCoins = amount // 2
    amount = amount - noOf2pCoins * 2
   
    noOf1pCoins = amount // 1
   
    print("The least amount of coins you can have for this amount is: ",
            noOf2PCoins, "x 2 Pound Coins,", noOf1PCoins, "x 1 Pound Coins,",
             noOf50pCoins, "x 50p Coins,", noOf20pCoins, "x 20p Coins,",
              noOf10pCoins, "x 10p Coins,", noOf5pCoins, "x 5p Coins,",
               noOf2pCoins, "x 2p Coins,", noOf1pCoins, "x 1p Coins,")
selectCoins()
    

    

    
    