# Practical Worksheet 1: Getting started with Python
# Matthew Hawkins 769535
# September 2015

def sayHello():
    print("Hello world")

def count():
    for i in range(10):
        print(i + 1)

def kilos2pounds():
    kilos = eval(input("Enter a weight in kilograms: "))
    pounds = 2.2 * kilos
    print("The weight in pounds is", pounds)

def sayName():
    myName = "Matthew Hawkins"
    print(myName)
    
def helloWorld2():
    print("Hello")
    print("World")
    
    
def euros2pounds():
    euros = eval(input("Enter an amount in euros: "))
    pounds = 1.45 / euros
    print("The value in pounds is", pounds)
    
def addUp():
    val1 = eval(input("Enter your 1st value: "))
    val2 = eval(input("Enter your 2nd value: "))
    sum = val1 + val2
    print(sum) #add user output to improve ease of use
    
def changeCounter():
    onePence = eval(input("How many 1p's do you have?: "))
    twoPence = eval(input("How many 2p's do you have?: "))
    fivePence = eval(input("How many 5p's do you have: "))
    
    twoPence = twoPence * 2
    fivePence = fivePence * 5
    
    total = onePence + twoPence + fivePence
    
    print(total)
    
def tenHellos():
    #i = counter
    for i in range(10):
        print("Hello World")
    
def weightsTable(kilos):
    #i = counter
    for i in range(0,(kilos + 10),10):
        print(i, "Kg", " ", round((i * 2.2),2) ,"lb") #could make less complicated to make it easier to read, i.e. all on seperate lines as opposed to one line
        
print(weightsTable(100))

def valueFunction():
    amount = eval(input("Enter the original amount of investment: "))
    years = eval(input("Enter the number of years of investment: "))
    #i = counter
    for i in range(years):
        amount *= 1.055
    return round(amount,2)
    
print(valueFunction())

        
        