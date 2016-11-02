#INTRODUCTION TO R

#R can be used as an ordinary calculator
2+3*5
log(10)
4^2
sqrt(16)

#To run a line a of code, place your cursor anywhere on the line and press Ctrl+Enter.

#Assignment operator (<-) stores the value (object) on the right side of (<-) expression in the left side
x<-log(10)*pi
y<-(47*31)
#We can output the answers by typing:
x
y
#We can even do:
x*y

#1. Vectors

#We can enter data by hand.
#ex1 is what I'm naming the dataset (remember all names go on the left side of <-). Pretend this is a list of
#the number of ducklings that hatched from 12 separate mallard nests around campus this summer.
#I could change this name of the dataset to almost anything (like duckling), but there are some rules. 
#Note the "c" which means keep these numbers together, ie "combine".

ex1 <- c(1,2,4,3,5,7,9,4,5,7,2,7) 
#output data set:
ex1

#2. Ways we can display the data

hist(ex1) #creates a histogram, which allows us to describe the distribution of ex1
boxplot(ex1) #creates a boxplot, more useful when comparing across different groups of data

#3. Adjusting displays
#There are a lot of ways to change the display of the data. We can change the color, for instance:
hist(ex1,col="pink")

#or even the borders around the bars
hist(ex1,col="pink",border="blue")

#NOTE the QUOTES around the colors. You always need quotes when you are using character arguments.
#A character argument is usually anything besides a number.

#An ARGUMENT is a line of code that tells R to adjust something within the overall command.
#For example, in the above histogram, the overall command is to build a histogram: hist(ex1). The arguments
#are additions you put in that tells R how to adjust the details, like color (col) and bar borders (border).

#If you don't specify additional arguments, R will use the defaults (ie black color, for example).

#What if we want to know more about the hist command and ways to change the default settings?
help(hist) #help gives us information about the command - used if you know the name of the command
help.search("histogram") #could be used if you didn't know the name of the command

#To SAVE A GRAPH: Export-Save As Image

#4. Summary statistics/Numerical descriptions

#measures of center - there are two common ones: the mean and median
#We find the mean by summing all the numbers and dividing by the number of observations.
#The mean command below would then get us the mean number of ducklings that hatched per nest on campus.

mean(ex1)

#The median is the 50th percentile - the middle number or the mean of the two middle numbers if there is an even 
#number of observations. How different the mean and median are tells you whether the data is skewed to one extreme.

median(ex1)

summary(ex1) #gives the "5 number summary - min, 1st quartile (Q1), median, 3rd quartile (Q3), max - plus the mean

#variance and standard deviation are measures of spread
var(ex1) #variance
sd(ex1) #standard deviation, which is the square root of the variance

#6. Saving your script
#Simply go to File Save As to save your script in any location. This is helpful for when you start coding
#in class and don't finish, but want to have what you have already coded.
#REMEMBER TO SAVE YOUR FILE AS .R or R won't be able to open it. It has to be a CAPITAL R. The program is case-sensitive.

#7. Errors you may get
hist(ex1
     #the "+" you see means what you typed is incomplete. You can see we're missing a closing parantheses. So we type:
)

his(ex1)
#Here R is telling us there is no command calld "his" In this case, you probably spelled the command incorrectly.

#8. Handy tricks:
#To see worked examples of functions, type example and the name of the function in parentheses
example(mean)

#Demos are useful for seeing the range of what R can do (10 graph styles):
demo(graphics)

-------------------------------------------------------------------------------------------------------------------
#Inputting Data: Vectors, Matrices, Data Frames

#Recall how we created a vector (don't forget the "c" in front):
x <-c(8,0,3,7,4,4,90,89,101,123)

#Sorting a vector
sort(x)#this will automatically sort in increasing order
sort(x,decreasing=TRUE)#specify this second part if you want decreasing order

#How to make a MATRIX
#A matrix refers to a numeric array of rows and columns. One easy way to create
#a matrix is to combine vectors of equal length using cbind() meaning "column bind."

#Let's make another vector first
y <-c(1,7,3,10,97,33,18,2,14,9)

#Combine the 2 vectors
m1<-cbind(x,y)
m1

t(m1) #transpose of m1 (horizontal instead of vertical). 
dim(m1) #this tells you number of rows and columns

#You can also directly list the elements and specify the matrix dimensions
m2 <-matrix(c(1,3,2,5,-1,2,2,3,9),nrow=3)
m2

#To specify filling by rows instead of columns (as above), we can write:
m2 <-matrix(c(1,3,2,5,-1,2,2,3,9),ncol=3,byrow=T)
m2

#Making a DATA FRAME
#A data frame is an array consisting of columns of various types (numeric, character, etc).
#Small to moderate size data frame can be constructed by data.frame()

#Example: Constructing a data frame from data on birds collected in a mist net
#In addition to numbers, you can make vectors with words. These are called character vectors.
#BUT don't forget to put names in quotes!

#Let's make our first 2 vectors of species and ages 
Spp<-c("American Robin","European Starling","Blue Jay","Indigo Bunting","Northern Cardinal","Baltimore Oriole","Titmouse","American Redstart","House Sparrow","Kinglet") 
Age<-c("First year","Adult","Fledgling","Adult","Adult","First year","Fledgling","Fledgling","Adult","Adult")

#To save time typing repetitive information (like sexes), we can use the rep() command
Sex<-c(rep("Male",5),"Female","Male",rep("Female",3)) #rep("Male",5) tells R to repeat Male 5 times
Sex 

#Next we want to add column for weights (grams) of birds and band sizes used
Weight<-c(22,25,30,14,32,28,18,16,17,12) 
Size<-c(3,3,3,2,3,3,2,2,2,1) 

#Combine all of these vectors into one data frame using data.frame(). NOTE: vector names don't need to be in quotes
#because you've already told R that there's data stored under that vector name.
Birds<-data.frame(Spp,Age,Sex,Weight,Size) 
Birds

#Calculating measurements from a data frame:
#Use your data frame to calculate desired measurements, like mean or standard deviation.
mean(Birds$Weight)
sd(Birds$Weight)

#Use the following command to get a sample from your 'population'.
sample(Birds$Weight,3)
#In parentheses, the first part, Birds$Weight, tells R where to draw the sample from (ie what column of what data frame)
#The second part tells R how many samples to draw. I chose 3.

-----------------------------------------------------------------------------------------------------

##########################################################
###PRACTICING WITH A FULL DATASET########################
#########################################################
#Load the data. We'll talk about the ways of doing this next lab.
source("http://www.openintro.org/stat/data/arbuthnot.R") #instructs R to open web link and extract specific data

#This dataset is the Arbuthnot baptism counts for boys and girls. You should see that the workspace area in the upper righthand corner of the
#RStudio window now lists a data set called arbuthnot that has 82 observations on 3 variables.

#The Arbuthnot data set refers to Dr. John Arbuthnot, an 18th century physician, writer, and mathematician.
#He was interested in the ratio of newborn boys to newborn girls, so he gathered the baptism records for
#children born in London for every year from 1629 to 1710. We can take a look at the data by typing its
#name into the console.
arbuthnot

#What you should see are four columns of numbers, each row representing a different year: the first entry
#in each row is simply the row number (an index we can use to access the data from individual years if
#we want), the second is the year, and the third and fourth are the numbers of boys and girls baptized that
#year, respectively.

#Note that the row numbers in the first column are not part of Arbuthnot's data. R adds them as part of
#its printout to help you make visual comparisons. You can think of them as the index that you see on the
#left side of a spreadsheet.

#How can we see the dimensions of this data frame?


#Remember We can access the data in a single column of a data frame separately using a command like
arbuthnot$boys
#Note that R printed these out as a vector (no longer part of a data frame)

#Let's make a simple plot of the number of girls baptized per year with the command:
plot(arbuthnot$year, arbuthnot$girls)
#remember that you put what you want on the x axis first, y axis variable second

#If we wanted to connect the data points with lines, we could add a third argument, the letter "l" for line.
plot(arbuthnot$year, arbuthnot$girls, type = "l")

#How would we make a plot of the total number of baptisms per year?

#Finally, in addition to simple mathematical operators like subtraction and division, you can ask R to
#make comparisons like greater than, >, less than, <, and equality, ==. For example, we can ask if boys
#outnumber girls in each year with the expression
arbuthnot$boys > arbuthnot$girls
#This command returns 82 values of either TRUE if that year had more boys than girls, or FALSE if that year did not

################################
##In-Class Exercises############
###############################

#EX 1
#Imagine that you are collecting 20 leaves from trees of various species in your study area to determine primary productivity.
#Create a data frame that includes the following hypothetical data in columns (make up your own data):
#species of tree, width of leaf, length of leaf, whether herbivory evidence is present on the leaf (yes or no)

#Ex 2
#What command would you use to extract just the widths of the leaves?

#EX 3
#Calculate summary statistics for each relevant numerical variable in the data frame.

#EX 4
#Create a histogram of the leaf lengths. 
#Read the help file for the hist() command to adjust at least 2 arguments from default settings.

#Answer to question above about plotting total number of baptisms
plot(arbuthnot$year, arbuthnot$boys + arbuthnot$girls, type = "l")