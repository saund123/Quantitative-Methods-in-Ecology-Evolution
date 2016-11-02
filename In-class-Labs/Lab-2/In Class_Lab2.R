#LAB 2
#Reading in a dataset from a file
#Entering all of our data by hand in R can take a long time if we have a large dataset.
#Another option allows us to read in the dataset from a webpage or text file on your computer 

dat <- read.table("http://ecology.msu.montana.edu/labdsv/R/labs/lab2/brycesite.R", head=T) #example from reading data from a website
dat <- read.table("Mydata.txt",head=T) #example code for reading text file from computer (need to have file in a pre-specified location)

#head=T tells it that we have the variable names in the first row of the dataset.
#You will almost always need to have that.
#Also note the QUOTATION MARKS on either side of the URL or text file name. You always need these!

#After we read in the dataset, it is always a good idea to do a few checks to make sure nothing
#has gone wrong. Let's try this with the URL data from Bryce Canyon National Park.

names(dat) #names of the variables in the file. NOTE: replace "dat" in parantheses with whatever you named your data when you read it in
head(dat) #first six rows of the dataset
tail(dat) #last six rows of the dataset
dim(dat) #dimensions of the dataset - #rows #cols
dat #prints entire dataset - ok for short datasets, bad idea for large ones

#Now, we'd like to just look at the variable depth, so let's just type depth and press enter...

depth

#It doesn't seem to know depth exists.  
#One way to fix this is to put the name of the dataset in front followed by the "$" symbol, like this:

dat$depth

#You can see it pulls up the entire column of depth.
#We could also attach the dataset and then we can just type the variable name.

attach(dat) #attach allows us to use variables without having to put the name of the dataset and $ in front
depth #now this works

#I recommend using attach(dat) whenever you load in a new dataset. Of course, change the "dat" according
#to whatever you name your data.

----------------------------------------------------------------------------------------------------------
#PLOTTING
#The plot command has the format plot(x,y) where x is the variable you want on the x axis
#and y is on the y axis
#To have a line connecting the points, remember to include type="l" in the plot command:
plot(x,y,type="l") 

#you can add a second line on top of a line already on a plot
lines(x,y,type="l") #call the second plot a "line" to tell R to put it in the same graph.
#the lwd=2 in the command above changes the weight of the line (darker) so you can tell the difference between the 2

#let's try plotting with the data we downloaded from online (dat). Note: it needs to be attached first
plot(sort(elev)) #to see elevation distribution
lines(c(1,160),range(elev),col=2) #to overlay a straight line of perfect distribution; col=2 means use red for the line.

---------------------------------------------------------------------------------------------------------
#Joint distributions
#To look at joint distributions of variables, simply specify one variable as the X axis, and a second variable as the Y axis. 
#The vectors must be the same length. For example,
plot(av,elev)

#The joint distribution of elevation and aspect values is pretty good, and we should be able to employ both variables in analyses 
#without worrying about correlation problems. If desired, the actual correlation can be tested easily.
cor(av,elev) #we get 0.09, so no correlation btw. the 2 variables

#Sometimes we're interested in how two variables co-occur given a third variable. For example, in Bryce Canyon we might be 
#interested in how the joint distribution of elevation and aspect value varies as a function of soil depth. 
#The simplest approach to this problem is to split the graphic page into two panels as follows:

par(mfcol=c(1,2)) # to get a double plot--I'll explain more about this command in a later lab

plot(elev[depth=='deep'],av[depth=='deep'])  # to see the joint distribution on deep soil
#this code says to plot elev vs. av but it specifies that R should only plot the observations for which soil depth is 'deep'.

plot(elev[depth=='shallow'],av[depth=='shallow'])  # to see the joint distribution on shallow soil
#this code says to plot elev vs. av but it specifies that R should only plot the observations for which soil depth is 'shallow'.

#Alternatively, numerous small panels get difficult to read, and a good alternative is the box plot.
par(mfcol=c(1,1))     # return to single plots
boxplot(elev~depth)   # produces a simple visualization of elevation by soil depth

#The ~ character in the boxplot command is R for "as a function of" so that boxplot(elev~depth) means plot elev as a function of depth. 
#More on this in a later lab.

-------------------------------------------------------------------------------------------------------------
#Loading data from a CSV file

#First, download the file from D2L: uk.metals.in.fish.csv
#Save as a .csv file (keep same name) on your desktop
#Then go to Session, Set working directory, Choose Directory... and make sure Desktop is selected
#If you didn't save the file on the Desktop, select the path for wherever that file is located.
#You always need to tell R the directory where your file is located!
#Then load the data with this code:
fish<-read.csv("uk.metals.in.fish.csv",header=T,sep=",")  #sep="," means you saved it as a comma-limited file
head(fish) #run our data checks
names(fish)
tail(fish)

attach(fish) #now attach the file so you can refer to variables within it without "$"

#Calculating Means
#Use the mean() command we've gone over to calculate the mean concentration of metals in each species
mean(Cod, na.rm=T) #you only need to include na.rm=T if there are NAs present in the data that you haven't already omitted

#Apply function
#We can use lapply() to get the means for all species in one step.
#The format is lapply(X,fun) where X stands for the data name and fun is the function you want to apply (ie mean, sd, sum, etc)

lapply(fish, mean, na.rm=T) #again, we have to include na.rm=T because we have NAs in the data

---------------------------------------------------------------------------------------------------
#Subsetting data
  
#Here is a dataset of mortality rates for charismatic megafauna in Western Africa vs. Northern Europe input directly as a data frame. 

region<-c(rep("Western Africa",17),rep("Northern Europe",13))
country<-c("Benin","Burkina Faso","Cape Verde","Cote dIvoire","Gambia","Ghana","Guinea","Guinea-Bissau","Liberia","Mali","Mauritania","Niger","Nigeria","Saint Helena","Senegal","Sierra Leone","Togo","Channel Islands","Denmark","Estonia","Faeroe Islands","Finland","Iceland","Ireland","Isle of Man","Latvia","Lithuania","Norway","Sweden","United Kingdom")
mortality<-c(155.7,160.2,35.9,173.1,134.1,93.4,175.8,209.8,229.3,181.0,156.4,209.9,132.7,NA,112.1,307.3,136.4,6.5,6.5,11.4,NA,4.8,4.2,7.0,NA,17.7,11.3,5.9,4.3,6.5)
fauna<-data.frame(region, country,mortality)
fauna<-na.omit(fauna) #omit missing data
fauna
attach(fauna)

#We want to calculate summary stats for each region (W. Africa and N. Euro)
#You can tell R to calculate mean mortality according to region category with the code below. 
#Note this is the same format that we used above to specify that we wanted to plot elev vs. av according to soil depth
#So think of [] paired with == as 'according to' when you're coding.

mean(mortality[region=="Western Africa"],na.rm=TRUE) #you can find each individually
summary(mortality[region=="Northern Europe"],na.rm=TRUE) #or you can use summary() to get all these at once


