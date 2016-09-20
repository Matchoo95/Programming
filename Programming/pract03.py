# Practical Worksheet 3: Graphical Programming
# Matthew Hawkins, 769535

from graphics import *
import math

def drawStickFigure():
    win = GraphWin("Stick figure")
    head = Circle(Point(100, 60), 20)
    head.draw(win)
    body = Line(Point(100, 80), Point(100, 120))
    body.draw(win)
    arms = Line(Point(70, 90), Point(130, 90))
    arms.draw(win)
    leftleg = Line(Point(100, 120), Point(50, 120))
    leftleg.draw(win)
    rightleg = Line(Point(100, 120), Point(150, 120))
    rightleg.draw(win)


def drawCircle():
    win = GraphWin("Draw Circle")
    radius = eval(input("Enter the radius of a circle: "))
    circle1 = Circle(Point(100, 100), radius)
    circle1.draw(win)
    
def drawArcheryTarget():
    win = GraphWin("Draw Archery Target")
    blueCircle = Circle(Point(100, 100), 50)
    blueCircle.setFill("blue")
    blueCircle.draw(win)
    redCircle = Circle(Point(100, 100), 25)
    redCircle.setFill("red")
    redCircle.draw(win)
    yellowCircle = Circle(Point(100, 100), 12.5)
    yellowCircle.setFill("yellow")
    yellowCircle.draw(win)
    
def drawRectangle():
    win = GraphWin("Draw Rectangle")
    height = eval(input("Enter the height of the rectangle: "))
    width = eval(input("Enter the width of the rectangle: "))
    
    pos1 = Point((100 - (width / 2)), (100 - (height / 2)))
    pos2 = Point((100 + (width / 2)), (100 + (height / 2)))
    
    rectangle = Rectangle(pos1, pos2)
    
    rectangle.draw(win)
    
def tenLines():
    win = GraphWin("Line drawer")
    for i in range(10):
        message = Text(Point(100, 100), "Click on the first point")
        message.draw(win)
        pos1 = win.getMouse()
        message.setText("Click on the second point")
        pos2 = win.getMouse()
        line = Line(pos1, pos2)
        line.draw(win)
        message.setText("")

def tenStrings():
    win = GraphWin("10 strings")
    inputBox = Entry(Point(100, 10), 10)
    inputBox.draw(win)
    
    for i in range(10):
       
        mouse = win.getMouse()
        point1 = mouse.getX()
        point2 = mouse.getY()
        
        message = Text(Point(point1, point2), inputBox.getText())
        message.draw(win)
    win.mainloop()


def tenColouredRectangles():
    win = GraphWin("10 rectangles", 500, 500)
    for i in range(10):
        message = Text(Point(250, 200), "Enter a colour and then click to make the rectangles: ")
        message.draw(win)
        inputBox = Entry(Point(250, 250), 10)
        inputBox.setText("blue")
        inputBox.draw(win)
       
        mouse1 = win.getMouse()
        mouse1x = mouse1.getX()
        mouse1y = mouse1.getY()
        
        mouse2 = win.getMouse()
        mouse2x = mouse2.getX()
        mouse2y = mouse2.getY()
        
        colour = inputBox.getText()
        
        rectangle = Rectangle(Point(mouse1x, mouse1y),Point(mouse2x, mouse2y))
        
        rectangle.draw(win)
        
        rectangle.setFill(colour)
        
def fiveClickStickFigure():
    win = GraphWin("Stick Figure", 400, 400)
    
    mouse = win.getMouse()
    
    mouseX = mouse.getX()
    mouseY = mouse.getY()
    centre = Point(mouseX, mouseY)
    
    distance = math.sqrt((p.getX() - mouseX)**2 + (p.getY() - mouseY)**2)
    
    circle = Circle(centre, distance)
    circle.draw(win)
    
    mouse = win.getMouse()
    
    bottom = mouse.getY()
    body = Line(Point(mouseX,(mouseY + distance)), Point(mouseX, mouse.getY()))
    body.draw(win)
    
    mouse = win.getMouse()
    
    leftArm = Line(Point(mouseX, mouse.getY()), Point(mouse.getX(), mouse.getY()))
    distance = mouse.getX() - mouseX
    
    rightArm = Line(Point(mouseX, mouse.getY()), Point(mouseX - distance, mouse.getY()))
    
    leftArm.draw(win)
    rightArm.draw(win)
    
    mouse = win.getMouse()
    
    leftLeg = Line(Point(mouse.getX(), mouse.getY()), Point(mouseX, bottom))
    distance = mouse.getX() - mouseX
    
    rightLeg = Line(Point(mouseX, bottom), Point(mouseX - distance, mouse.getY()))
    
    leftLeg.draw(win)
    rightLeg.draw(win)
    win.mainloop(win)
  
    
def plotRainfall():
    win = GraphWin("Rainfall", 220, 220)

    input = Entry(Point(110, 10), 5)
    msg = Text(Point(110, 30), "Click to plot the graph")
    msg.draw(win)
    input.draw(win)
    
    x1 = 25
    x2 = 50
    y1 = 200
    
    for i in range(7):
        mouse = mouse.getMouse()
        y2 = eval(input.getText()) * 2
        y2 = y1 - y2
        bottomCoordinate = Point(x1, y1)
        topCoordinate = Point(x2, y2)
        bar = Rectangle(bottomCoordinate, topCoordinate)
        bar.setFill("blue")
        label = Text(Point(x1 + 12, y1 + 10), input.getText())
        label.draw(win)
        x1 += 25
        x2 += 25
        bar.draw(win)
    win.mainloop()

#drawStickFigure()
#drawCircle()
#drawArcheryTarget()
#drawRectangle()
#tenLines()
#tenStrings()
#tenColouredRectangles()
#fiveClickStickFigure()
#plotRainfall()

def test():
    win = GraphWin("Stick figure")

    # Head
    head = Circle(Point(100, 60), 20)
    head.draw(win)

    # Body
    body = Line(Point(100, 80), Point(100, 120))
    body.draw(win)

    # Arms
    leftArm = Line(Point(100, 80), Point(80, 110))
    leftArm.draw(win)
    rightArm = Line(Point(100, 80), Point(120, 110))
    rightArm.draw(win)

    # Legs
    leftLeg = Line(Point(100, 120), Point(90, 160))
    leftLeg.draw(win)
    rightLeg = Line(Point(100, 120), Point(110, 160))
    rightLeg.draw(win)

    # Floor
    floor = Line(Point(0, 160), Point(200, 160))
    floor.draw(win)

    # Balls
    ball = Circle(Point(80, 110), 10)
    ball.draw(win)

    message = Text(Point(100,100), "Damn!")
    message.getText()

    for i in range(len("Damn!")):
        
        
        x = 100
        y = 25
        
        mouse = win.getMouse()
        ball.move(0, 10)

        msg = Text(Point(x + (i * 10) ,y), "Damn!"[i])
        msg.draw(win)


    ball.undraw()
    mouse = win.getMouse()

test()




from graphics import *

def waiter():
    win = GraphWin("Stick figure", 300, 200)

    #Draw Head
    head = Circle(Point(200, 60), 20)
    head.draw(win)

    #Draw Body
    body = Line(Point(200, 80), Point(200, 120))
    body.draw(win)

    #Draw Arms
    armL = Line(Point(200, 90), Point(160, 80))
    armL.draw(win)
    armR = Line(Point(200, 90), Point(240, 80))
    armR.draw(win)

    #Draw Legs
    legL = Line(Point(200, 120), Point(170, 170))
    legL.draw(win)
    legR = Line(Point(200, 120), Point(230, 170))
    legR.draw(win)

    #Draw tray
    tray = Rectangle(Point(140, 80), Point(180, 75))
    tray.setFill("brown")
    tray.draw(win)

    #Draw Glass
    glass = Rectangle(Point(150, 75), Point(160, 60))
    glass.setFill("white")
    glass.draw(win)

    #Draw Cake
    cake = Circle(Point(165, 71), 4)
    cake.setFill("yellow")
    cake.draw(win)

    #Set up text
    text = "Smash!"
    displayText = Text(Point(100, 25), "")
    displayText.draw(win)

    #Move glass down and update text
    for i in range(6):
        win.getMouse()
        glass.move(0, 15)
        displayText.setText(text[0:i+1])

    #Undraw Glass
    win.getMouse()
    glass.undraw()

    win.mainloop()