#-------------------------------------------------------------------------------
# Practical Worksheet 7: Booleans and while loops
# Matthew Hawkins
# up769535
# Autumn Teaching Block 2014
#-------------------------------------------------------------------------------

from graphics import *
from time import *
from pract05 import *
from pract06 import *


def getName(): 
    name = ""
    while name.isalpha() == False:
        name = input("Please enter a valid name: ")
    return name

def trafficLights():
    win = GraphWin()
    red = Circle(Point(100, 50), 20)
    red.setFill("red")
    red.draw(win)
    amber = Circle(Point(100, 100), 20)
    amber.setFill("black")
    amber.draw(win)
    green = Circle(Point(100, 150), 20)
    green.setFill("black")
    green.draw(win)
    while True:
        red.setFill("red")
        amber.setFill("black")
        green.setFill("black")
        sleep(5)
        red.setFill("red")
        amber.setFill("yellow")
        green.setFill("black")
        sleep(2)
        red.setFill("black")
        amber.setFill("black")
        green.setFill("green")
        sleep(5)
        red.setFill("black")
        amber.setFill("yellow")
        green.setFill("black")
        sleep(2)
        if win.getMouse(): 
            break
            
def calculateGrade(mark): 
    if mark < 8 and mark >= 0:
        grade = "F"
    elif mark >= 8 and mark <= 11:
        grade = "C"
    elif mark >= 12 and mark <=15:
        grade = "B"
    elif mark > 15 and mark <= 20:
        grade = "A"
    return grade
        
def gradeCoursework():
    grade = ""
    mark = 100
    while not(mark >= 0 and mark <= 20):
        mark = eval(input("Please enter a valid mark: "))
    grade = calculateGrade(mark)
    print("The pupil achieved a grade of", grade)
        
def orderPrice():
    total = 0
    while True:
        price = eval(input("Please enter the price of the item: "))
        quantity = int(eval(input("Please enter the quantity of that item: ")))
        total = total + (price * quantity)
        answer = input("Would you like more items? (Y/N): ")
        if answer.upper() == "N":
            break
    print("Total price is: ", "{0:0.2f}".format(total))
        
def clickableEye(): 
    win = GraphWin("Click Eye", 300, 300)
    drawBrownEye(win, Point(150, 150), 100)
    label = Text(Point(30, 30), "")
    label.draw(win)
    while True:
        click = win.getMouse()
        dist = distanceBetweenPoints(click, Point(150, 150))
        if dist >= 100:
            break
        elif dist >= 50:
            label.setText("Sclera")
        elif dist >= 25:
            label.setText("Iris")
        else:
            label.setText("Pupil")
    win.close()

def fahrenheit2Celsius(fahrenheit):
    return (fahrenheit - 32) * 5 / 9

def celsius2Fahrenheit(celsius):
    return 9 / 5 * celsius + 32
    
def temperatureConverter():
    while True:
        choice = input("For F to C - Enter 1 || For C to F - Enter 2: ")
        if choice.upper() == "1":
            temp = eval(input("Please enter the temperature in Fahrenheit to convert to Celcius: "))
            answer = fahrenheit2Celsius(temp)
        else: 
            temp = eval(input("Please enter the temperature in Celcius to convert to Fahrenheit: "))
            answer = celsius2Fahrenheit(temp)
        print(answer)
        askexit = input("Enter X to exit")
        if askexit.upper() == "X: ":
            break
            
def guessTheNumber():
    randnum = random.randint(1, 100)
    guess = 0 
    while guess < 7:
        inputnum = eval(input("Enter the number you guess: "))
        if randnum == inputnum:
            print("You win!")
            break
        elif randnum > inputnum:
            print("Too low!")
        elif randnum < inputnum:
            print("Too High!")
        guess = guess + 1
    print("The answer was", randnum)
        
def tableTennisScorer():
    win = GraphWin("Score", 400, 400)
    rect1 = Rectangle(Point(0,0), Point(200, 400))
    rect2 = Rectangle(Point(200,0), Point(400,400))
    rect1.setFill("light blue")
    rect2.setFill("white")
    rect1.draw(win)
    rect2.draw(win)
    
    score1 = 0
    score2 = 0
    scoretxt1 = Text(Point(100, 150), score1)
    scoretxt2 = Text(Point(300, 150), score2)
    scoretxt1.setSize(35)
    scoretxt2.setSize(35)
    scoretxt1.draw(win)
    scoretxt2.draw(win)
    
    wintxt1 = Text(Point(100, 300), "Winner")
    wintxt2 = Text(Point(300, 300), "Winner")
    
    while True:
        click = win.getMouse()
        if click.getX() < 200:
            score1 = score1 + 1
            scoretxt1.setText(score1)
        else: 
            score2 = score2 + 1
            scoretxt2.setText(score2)
        if score1 >= 11:
            if score1 > score2 + 1:
                wintxt1.draw(win)
                break
        elif score2 >= 11:
            if score2 > score1 + 1:
                wintxt2.draw(win)
                break
                
def clickableBoxOfEyes(row, column):
    win = GraphWin("Box Of Eyes", (row * 100 + 100), column * 100 + 100)
    borderpoint1 = Point(50, 50)
    borderpoint2 = Point(row * 100+50, column * 100+50)
    border = Rectangle(borderpoint1, borderpoint2)
    border.draw(win)
    label = Text(Point(borderpoint1.getX() + borderpoint2.getX() / 2, borderpoint2.getY() + 25), "Click on an eye to see position")
    label.draw(win)
    
    x = 100
    y = 100
    for i in range(column):
        for j in range(row):
            drawCircle(win, Point(x, y), 50, "white")
            drawCircle(win, Point(x, y), 30, "blue")
            drawCircle(win, Point(x, y), 20, "black")
            x = x + 100
        x = 100
        y = y + 100
      
    while True:
        click = win.getMouse()
        if click.getX() < borderpoint1.getX() or click.getX() > borderpoint2.getX() or click.getY() <               borderpoint1.getY() or click.getY() > borderpoint2.getY():
            break
        
    
            
