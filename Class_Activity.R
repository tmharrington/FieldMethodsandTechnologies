1:6
# vector results-- create a list of vectors between x and y using ":" operator
a=1
# object 'a' is given the vector value '1' using '='
a
a+2
## 3
### 'a' can now be used as a vector object equivalent to 1
die=1:6
die

#Functions
round(2.4999999)
## 2
round(2.5000000)
## 2
round(2.5000001)
## 3

factorial(170)
#Biggest factorial possible in RStudio before inf (infinite)

mean(1:6)
## 3.5
mean(die)
## 3.5
round(3.5)
## 4

# Making the roll the dice function

sample(x=1:4, size = 2)
## 25% chance of being given vector 1,2,3,4 
## two vectors shown because size = 2

sample(x=die, size = 1)
## 'die' in x variable is 6 sided, 1/6 equal chance to roll each number


sample(x=die,
       size = 1,
       replace = TRUE)

sample(x =die, 
       size = 2, 
       replace = TRUE)
## replace argument allows the sample to draw the same number twice
## without this, it would not represent rolling dice since a number could
# not be obtained on the second 'roll'

