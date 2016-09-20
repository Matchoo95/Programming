#-------------------------------------------------------------------------------
# Practical Worksheet 6: if statements and for loops
# Matthew Hawkins
# 769535
# Autumn Teaching Block 2014
#-------------------------------------------------------------------------------

import math
from graphics import *
from random import *


def fastFoodOrderPrice():
    price = float(input("What is the price of your order? "))
    deliveryPrice = 1.50
    if price <= 10:
        price = price + deliveryPrice
    print("Your total price is: ", price)
    
def whatToDoToday():
    temp = eval(input("What is todays temperature in celcius? "))
    if temp > 25:
        message = ("You should go swimming in the sea!")
    elif temp > 9 and temp < 26:
        message = ("You should go shopping in Gunwharf Quays!")
    else:
        message = ("You should stay in and watch a film!")
    print(message)

def displaySquareRoots(start, end):
    for i in range(start - 1, end, 1):
        sqrtOfStart = float("{0:.3f}".format(math.sqrt(start)))
        print("The square root of", start, "is",sqrtOfStart)
        start = start + 1

def calculateGrade(mark):
    if mark > 15 and mark < 21:
        grade = "A"
    elif mark > 11 and mark < 16:
        grade = "B"
    elif mark > 7 and mark < 12:
        grade = "C"
    elif mark < 8 and mark > 0:
        grade = "F"
    else:
        grade = "X"
    return grade

def peasInAPod():
    numOfPeas = eval(input("How many peas are there? "))
    win = GraphWin("Peas in a Pod", numOfPeas * 100, 100)
    for i in range(numOfPeas):
        pea = Circle(Point(i * 100 + 50, 51), 50)
        pea.setFill("green")
        pea.draw(win)
    win.mainloop()

def ticketPrice(age, distance):
    ticket = 3.00
    distanceMultiplier = 00.15
    
    price = distance * distanceMultiplier + ticket
   
    if age < 16 or age > 59:
        price *= 0.6

    return price
    
def numberSquare(input):
    for i in range(input, 0, -1):
        row = []
        for j in range(input):
            row.append(str(i+j))
        print(" ".join(row))
        
def drawCircle(win, centre, radius, colour):
    circle = Circle(centre, radius)
    circle.setFill(colour)
    circle.setWidth(2)
    circle.draw(win)

def drawColouredEye(win, centre, radius, colour):
    drawCircle(win, centre, radius, "white")
    drawCircle(win, centre, radius * 0.5, colour)
    drawCircle(win, centre, radius * 0.3, "black")

def eyePicker():
    posx = eval(input("Please enter the coordinate x for the centre "))
    posy = eval(input("Please enter the coordinate y for the centre "))
    
    centre = Point(posx, posy)
    
    radius = eval(input("Please enter the radius "))
    colour = input("Please enter the colour ")
    win = GraphWin("eye", 500, 500) 
    if colour == "blue" or colour == "grey" or colour == "green" or colour == "brown":
        drawColouredEye(win, centre, radius, colour)
        win.mainloop()
    else:
        print("invalid colour entered")

def patchDesigns():
   
    
    radius = 55
    posX = 45
    posY = 45
    
    for i in range(10):
        
        radius = radius - 5
        posY = posY + 5
        
        centre = Point(posX, posY)
        loops = Circle(centre, radius)
        loops.setOutline("red")
        loops.setWidth(1)
        loops.draw(win)
   
def drawPatch(win, x, y, colour):
    
    radius = 55
    posX = x
    posY = y
    
    for i in range(10):
        
        radius = radius - 5
        posY = posY + 5
        
        centre = Point(posX, posY)
        loops = Circle(centre, radius)
        loops.setOutline(colour)
        loops.setWidth(1)
        loops.draw(win)

def drawPatchwork():
    win = GraphWin("patches", 300, 200)
    for i in range(2):
        n = i
        for i in range(3):
            drawPatch(win, (i * 100) + 50, (n * 100) + 45, "blue")

def eyesAllAround():
    win = GraphWin("eyes", 500, 500)
    
    counter = 1
    
    for i in range(30):
        if counter == 1:
            colour = "blue"
            counter = 2
        elif counter == 2:
            colour = "grey"
            counter = 3
        elif counter == 3:
            colour = "green"
            counter = 0
        else:
            colour = "brown"
            counter = 1
            
        click = win.getMouse()
       
        drawColouredEye(win, click, 30, colour)
    win.mainloop()
    