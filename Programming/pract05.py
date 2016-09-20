#-------------------------------------------------------------------------------
# Practical Worksheet 5: Using functions
# Matthew Hawkins
# 769535
# Autumn Teaching Block 2014
#-------------------------------------------------------------------------------

from graphics import *
import math


def areaOfCircle(radius):
    return math.pi * radius ** 2

def circumferenceOfCircle(radius):
    return math.pi * (2 * radius)
    
def circleInfo():
    radius = eval(input("Input the radius of the circle: "))
    area = areaOfCircle(radius)
    circumference = circumferenceOfCircle(radius)
    print("The area is {0:.3f} and the circumference is {1:.3f}".format(area, circumference))

def drawCircle(win, centre, radius, colour):
    circle = Circle(centre, radius)
    circle.setFill(colour)
    circle.setWidth(2)
    circle.draw(win)

#can condense repeated code down
#use the height modules in win, this means that if the values
#for circle are changed it will still be in the centre
def drawBrownEyeInCentre():
    win = GraphWin("draw eye", 200, 200)
    drawCircle(win, Point(100, 100), 60, "white")
    drawCircle(win, Point(100, 100), 30, "brown")
    drawCircle(win, Point(100, 100), 15, "black")


def drawBrownEye(win, centre, radius):
    drawCircle(win, centre, radius, "white")
    drawCircle(win, centre, (radius - 30), "brown")
    drawCircle(win, centre, (radius - 50), "black")
  
def drawPairOfBrownEyes():
    win = GraphWin("brown eyes", 400, 300)
    drawBrownEye(win, Point(200, 150), 60)
    drawBrownEye(win, Point(100, 150), 60)

    
def distanceBetweenPoints(p1, p2):
    distance = math.sqrt(((p2.getX() - p1.getX()) ** 2) + ((p2.getY() - p1.getY()) ** 2))
    return distance

def drawBlockOfStars(width, height):
    for i in range(height):
        print("*" * width)
        
def drawLetterE():
    drawBlockOfStars(8, 2)
    drawBlockOfStars(2, 2)
    drawBlockOfStars(5, 2)
    drawBlockOfStars(2, 2)
    drawBlockOfStars(8, 2)
    
def drawBlocks(gap1, ast1, gap2, ast2, height):
    gap1 = " " * gap1
    ast1 = "*" * ast1
    gap2 = " " * gap2
    ast2 = "*" * ast2

    for i in range(height):
        print(gap1 + ast1 + gap2 + ast2)
    
def drawLetterA():
    drawBlocks(1, 8, 1, 0, 2)
    drawBlocks(0, 2, 6, 2, 2)
    drawBlocks(0, 10, 0, 0, 2)
    drawBlocks(0, 2, 6, 2, 3)

#draw pairs of eyes
def drawFourBrownEyes():
    win = GraphWin("four eyes", 800, 800)
    for i in range(4):
        pos = win.getMouse()
        centre = Point(pos.getX(),pos.getY())
        pos = win.getMouse()
        radius = distanceBetweenPoints(centre, Point(pos.getX(),pos.getY()))
        drawBrownEye(win, centre, radius)

    









from graphics import *


def circles():
    win = GraphWin("Circles", 400, 400)
    for i in range(20):
        center = win.getMouse()
        if center.getX() <= 200 and center.getY() <= 200:
            colour = "red"
        elif center.getX() >= 200 and center.getY() <= 200:
            colour = "blue"
        else:
            colour = "white"
        circle = Circle(Point(center.getX(), center.getY()), 25)
        circle.setFill(colour)
        circle.draw(win)
    win.mainloop()


def circles2():
    win = GraphWin("Circles2", 400, 400)
    x = 25
    y = 225
    for i in range(16):
        center = win.getMouse()
        if center.getX() <= 200 and center.getY() <= 200:
            colour = "red"
        elif center.getX() >= 200 and center.getY() <= 200:
            colour = "blue"
        else:
            colour = "white"
        circle = Circle(Point(x,y), 25)
        circle.setFill(colour)
        circle.draw(win)
        if x < 175:
            x += 50
        else:
            y += 50
            x = 25
    win.mainloop()

