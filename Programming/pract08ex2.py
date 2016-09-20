from graphics import *

def main():
    
    xCoord, yCoord, doorNumber = getHouseInfo()
    doorColour, lightsOn = getInputs()
    drawHouse(xCoord, yCoord, doorNumber, doorColour, lightsOn)

def getInputs():
    doorColour = input("Enter door colour: ")
    lightsYN = input("Are the lights on (y/n): ")
    lightsOn = lightsYN[0] == "y"
    return doorColour, lightsOn
    
    
def getHouseInfo():
    xCoord = eval(Point("Enter an x coordinate for the window size " ))
    yCoord = eval(Point("Enter a y coordinate for the window size " ))
    doorNumber = eval(input("Enter a number for the door " ))
    
    return xCoord, yCoord, doorNumber
    
    
def drawHouse(xCoord, yCoord, doorNumber, doorColour, lightsOn):
    
    setCoords(xCoord.getX(), xCoord.getY(), yCoord.getX(), yCoord.getY())

    win = GraphWin("House", xCoord, yCoord)

    roof = Polygon(Point(2, 60), Point(42, 2),
                   Point(158, 2), Point(198,60))
    roof.setFill("pink")
    roof.draw(win)

    # draw wall and door
    drawRectangle(win, Point(2, 60), Point(198, 198), "brown")
    drawRectangle(win, Point(30, 110), Point(80, 198), doorColour)

    # draw window
    if lightsOn:
        windowColour = "yellow"
    else:
        windowColour = "black"
    drawRectangle(win, Point(110, 110), Point(170, 170), windowColour)
    
def drawRectangle(win, point1, point2, colour):
    rectangle = Rectangle(point1, point2)
    rectangle.setFill(colour)
    rectangle.setOutline(colour)
    rectangle.draw(win)

main()
