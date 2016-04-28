setwd("~/Documents/HS 616")
#1.
nums <- 4:-3
nums
colors <- c("red","blue","green","yellow")
typeof(colors)
assertions <- c(TRUE,FALSE)
assertions
length(nums)
length(colors)
nchar(colors)
length(assertions)

#2.
combined.data <-c(nums,colors,assertions)
combined.data
typeof(combined.data)
#After combining all the data became of type 'character'.Vector can hold data of same type only. Numerica data is
#no more interger and logical data also became strings. Once the data is combined, character type predominates the others
#so combination of different types of vectors is a limitation in R.

#3.
my.data <- data.frame(nums,colors,assertions)
my.data
# my.data is a table of 3 columns and 8 rows with nums,colors and assertions holding their respective values.
#Limitation is that it guesses/assumes row names if its not same size table.For eg, 5th row num value is 0 and red color and True value was repeated which acutally may not be true. 
#data frame can only operate well on a perfect matrix/ equal no. of rows and cols.It has to be all of same length. 
nrow(my.data)
ncol(my.data)
rownames(my.data)
colnames(my.data)
names(my.data)
#4.
colors.v <- my.data$colors
typeof(colors.v)
my.data2 <- data.frame(nums,colors,assertions, stringsAsFactors = F)
typeof(my.data2)
colors2.v <- my.data2$colors
typeof(colors2.v)
# Interesting. Colors was originally character. colors columns became string/character type when string as factors command 
# was kept to False. By default, characters become factors. 

#5.
colors.df <- data.frame(colors.v)
class(colors.df)
typeof(colors.df)
class(colors.df)
#type list, class data frame
not_green <- subset(my.data, my.data$colors != 'green')
not_green
x = my.data$nums
threes <- subset(my.data, x %% 3 == 0 )
threes
colors.num <- data.frame(my.data$nums, my.data$colors)
colors.num

#6.
new.nums <- as.character(nums)
new.colors <- as.factor(colors)
new.assertions <- as.numeric(assertions)
nums
new.nums
colors
new.colors
assertions
new.assertions
# as.character(), as.factor(), as.numeric() are not mutators of their arguements
# They dont change the original vectors. They modify and create copies instead.

#7.
as.character(nums)
as.numeric(assertions)
my.data
# By modifying a vector from which a data frame has been created, it does not change the data frame. 

is.factor(new.assertions)
# as.factor changes the type of the vector(eg. logical to integer,etc.)
# is.factor checks for factors/ levels. Makes it categorical. 

#8.
nums
my.data[,1]   # col using col index
my.data$nums  #col using col name
my.data[1,1] < my.data[2,1]
# No, it is not less. 
my.data[8,1] < my.data[2,1]
#yes it is less.

#9.
factor(my.data$nums, levels = c(-3,-2,-1,0,1,2,3,4))
as.numeric(my.data$assertions)

#10.
my.data[,1]   
my.data$nums
my.data[1,1] < my.data[2,1]
my.data[8,1] < my.data[2,1]

my.data$nums <- as.ordered(my.data$nums)
my.data$nums
my.data[1,1] < my.data[2,1]
my.data[8,1] < my.data[2,1]
# NO value in nums column of row 1 is not less than value in nums column of row 2
# YES value in nums column of row 8 is less than value in nums column of row 2

#comparison cant be done in ordinary factors.  
#conclude - Ordered factors differ from ordinary factors only in their class. Ordinary factors can have levels and be specified and created as wanted.
# Ordered factors are organized according to the correct order. 

#11. 
colnames(my.data) <- c("Integers","Letters","logical")
colnames(my.data)
my.data

#12.
list1 <- list("apple", 2, NA, FALSE )
list1
names(list1) <- c("char","numeric","NA","logical")
list1
any(is.na(names(list1)))
#FALSE
names(list1) <- c(c("char","numeric",NA,"logical"))
names(list1)
any(is.na(names(list1))) # TRUE
all(is.na(names(list1)))
#false
list1[[2]]

#13.
my.array <-array(1:6, dim = c(2,3))
my.array
my.array[2,3] = NA
my.array[1,2] = NA
my.array
my.array[is.na(my.array)] <- 0
my.array
any(my.array == 0)
all(my.array == 0)


    