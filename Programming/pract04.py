 #Practical Workseeht PO4: Strings and Files
 #Matthew Hawkins, 769535
 
from random import randint
from graphics import *
import os
 
def personalGreeting():
    name = input("Please enter your name: ")
    rannum = randint(0,3)
    if rannum == 0:
        msg = "Hey " + name + "! How are you?"
    if rannum == 1:
        msg = "Hello " + name + ". Nice to meet you!"
    if rannum == 2:
        msg = "What up" + name + ", how's it hanging?"
    if rannum == 3:
        msg = "こんにちは" + name + "さん、　よろしくお願いします！" 
    print(msg)
    
def formalName():
    firstName = input("What is your first name? ")
    lastName = input("What is your last name? ")
    formalName = firstName[0].upper() + ". " + lastName[0].upper() + lastName[1:]
    print(formalName)
    
def kilos2pounds():
    kilos = eval(input("Enter a weight in kilograms: "))
    pounds = 2.2 * kilos
    print(round(kilos, 2),  "kilos is", round(pounds, 2), "pounds")
    
def generateEmail():
    firstName = input("Please enter your first name: ")
    lastName = input("Please enter your last name: ")
    startYear = input("Please enter the year you enrolled with the University: ")
    
    print(lastName[0:4].lower() + "." + firstName[0].lower() + "." + startYear[2:] + "@myport.ac.uk")
    
def gradeTest():
    grades = "FFFFCCBBAAA"
    userGrade = eval(input("Enter your marks: "))
    print("Your grade is: " + grades[userGrade])
    
def graphicLetters():
    word = input("Enter a word: ")
    win = GraphWin("Letter Spacer", 400, 400)
    for i in word:
        mouse = win.getMouse()
        msgstr = Text(mouse, i)
        msgstr.draw(win)
    win.mainloop()
    
def singASong():
    word = input("Input a word: ") + " "
    
    row = int(eval(input("How many lines should the song be? ")))
    column = int(eval(input("How many times should the word be repeated per line? ")))
    word = word * column
    
    for i in range(row):
        print(word)
        
def exchangeTable():
    for i in range(20):
        pound = (i + 1) * 1.45
        print(i + 1, " Euros  | ", round(pound, 2), " Pounds")
        
def makeAcronym():
    phrase = input("Input a phrase: ")
    phrase = phrase.split(" ")
    acronym = ""
    for i in phrase:
        acronym = acronym + i[0]
    print(acronym.upper())
        
def nameToNumber():
    name = input("Enter a name: ").lower()
    name = list(name)
    total = 0
    for i in name:
        i = ord(i) - ord("z") + 26
        total += i
    print(total)

#Strings and Files not finished

def fileInCaps():
    file = input("Name of the file?: ")
    for line in open(file):
        print(line.upper())
    
def rainfallChart():
    for line in open("E:/rainfall.txt"):
        split = line.split()
        rain = int(split[1])
        asterixes = rain * "*"
        print(split[0] + "   " + asterixes)
        
        


def graphicalRainfallChart():
    win = GraphWin("Rainfall Chart")
    x1 = 25
    x2 = 50
    y1 = 130
    rain = [line.rstrip('\n') for line in open('rainfall.txt')]
    rain = ' '.join(rain)
    rain = rain.split(" ")
    town = rain[0::2]
    rain = rain[1::2]
    num = 0
    for i in rain:
        y2 = eval(rain[num])*8
        y2 = y1 - y2
        bcord = Point(x1,y1)
        tcord = Point(x2, y2)
        bar = Rectangle(bcord, tcord)
        bar.setFill("blue")
        ttext = town[num]
        townt = Text(Point(x1 + 12, y1 + 10), ttext[0:4])
        townt.setSize(5)
        townt.draw(win)
        x1 += 25
        x2 += 25
        bar.draw(win)
        num += 1
    win.mainloop()
    
def rainfallInInches():
    rain = [line.rstrip('\n') for line in open('rainfall.txt')]
    outfile = open('rainfallInches.txt', 'w')
    rain = ' '.join(rain)
    rain = rain.split(" ")
    town = rain[0::2]
    rain = rain[1::2]
    num = 0
    for i in rain:
        rainin = eval(rain[num]) / 2.54
        print(town[num], ' ', round(rainin,2), file=outfile)
        num += 1

def checkFile():
    filename = input("Input file name: ")
    checkedfile = [line.rstrip('\n') for line in open(filename)]
    line = 0
    for i in checkedfile:
        line += 1
    checkedfile = ' '.join(checkedfile)
    checkedfile = checkedfile.split()
    word = 0
    char = 0
    for i in checkedfile:
        char += len(checkedfile[word])
        word += 1
    print("Number of characters: ", char)
    print("Number of words: ", word)
    print("Number of lines: ", line)
    
    
#personalGreeting()
#formalName()
#kilos2pounds()
#generateEmail()
#gradeTest()
#graphicLetters()
#singASong()
#exchangeTable()
#makeAcronym()
#nameToNumber
#fileInCaps
#rainfaillChart()
#graphicalRainfallChart()
#rainfallInInches()
#checkFile()
