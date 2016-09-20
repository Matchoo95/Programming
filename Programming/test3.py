import math
from graphics import *
from random import *

def drawCircle(win, centre, radius, colour):
    circle = Circle(centre, radius)
    circle.setFill(colour)
    circle.setWidth(2)
    circle.draw(win)

def circles():
    win = GraphWin("circles", 400, 100)
    
    
    for i in range(25):
        click = win.getMouse()
        pos1 = click.getX()
        pos2 = click.getY()
    
        if pos1 < 201:
            colour = ""
         
        elif pos1 < 300 and pos1 > 200:
            colour = "red"
           
        else:
            colour = "blue"
     
     
        drawCircle(win, click, 10, colour)
    win.mainloop()
 
#   
# def circles2():
#     win = GraphWin("circles2", 400, 100)
#     
#     counter = 1
#     centre = 10
#     
#     if counter == 1:
#         colour = ""
#         counter = 2
#     elif counter == 2:
#         colour = "red"
#         counter = 3
#     else: 
#         colour = "blue"
#         counter = 0
#             
#     for i in range(5):
#         n = i
#         for i in range(5):
#             centre = centre + (i + 5)
#             drawCircle(win, centre, 10, colour)
#     win.mainloop()