# Додавання
1 + 1
2 + 2

# Віднімання
5 - 3 

3 * 5 # Множення

25 / 5
3 ^ 3

5 %% 3

17 %/% 5 + 5

2 + 3 * 4
(2 + 3) * 4


9 ^ 0.5
9 ^ (1/2)
sqrt(9)

abs(3 - 5)

log(15)

log(base = 3, x = 10)
log(10, 3)

log(x = 10,
    base = 3)

log(
  x = 10,
  base = 3
)

x = 4
y = 5
y * x

x <- 20
y <- 10
x - y

30 -> a

my_formula <- sqrt(x^2 + y^3)
my_formula
print(my_formula)



x == y
x != y
x > y
x < y
x >= y
x <= y

class(a)
is.numeric(a)
is.integer(a)

my_number <- 35
is.integer(my_number)
is.double(my_number)

my_num_int <- 35L
is.integer(my_num_int)

my_text <- "Hello, R!"
class(my_text)
my_text2 <- "П'ятниця"
my_num_chr <- '30'

my_true <- TRUE
my_false <- FALSE
class(my_true)

log_ten <- log(10)
# log(log)

data_gdp

c(2, 5, 10)
c('два', "п'ять", "десять")
c(TRUE, FALSE, TRUE)

1:5
3:-2

seq(from = 2,
    to = 10,
    by = 0.5)

seq(2, 10, by = 0.5)

seq(2, 10, length.out = 100)

rep('Hello!', 5)
rep(1:3, 3)
rep(1:3, 1:3)

my_vec_1 <- c("R", "=")
my_vec_2 <- c('Love')
c(my_vec_1, my_vec_2)

c(35, 'Hello!')
c(TRUE, 2, FALSE)
c(TRUE, 2, 'Hello!')

3 - TRUE

as.character(c(TRUE, 2, FALSE, FALSE))

vec_1 <- 1:5
vec_2 <- 2:6

vec_1 + vec_2
vec_1 * vec_2

vec_1 ^ vec_2 + vec_1 - vec_1 * vec_2
sqrt(vec_1)

vec_3 <- 1:2
vec_4 <- 1:4
vec_3 * vec_4

vec_5 <- 1:3

vec_3 + vec_5


long_vector <- -50:50
long_vector[50]
long_vector[2:5]

long_vector[-1]
long_vector[c(-1, -10)]

my_matrix <- matrix(1:16, nrow = 4, ncol = 4)

matrix(1:16, nrow = 4, ncol = 4, byrow = TRUE)

my_matrix[2, 2]
my_matrix[1:2, 2:3] <- 0

my_array <- array(1:16, dim = c(4, 2, 2))
my_array

my_list <- list(
  vec = 1:5,
  string = 'Hello, R!',
  matrix = my_matrix
)

my_list[[1]]
my_list$string
my_list[[2]]
my_list$matrix
my_list[['vec']]

my_df <- data.frame(
  name = c('Ігор', "Віталій", "Аліна"),
  sex = c('ч', "ч", "ж"),
  phd = c(TRUE, TRUE, TRUE),
  count = c(25, 30, 35)
)
my_df

str(my_df)

head(my_df, n = 2)

tail(my_df, n = 2)

names(my_df)

my_df$name
my_df$name[c(1, 3)]
my_df[2]

my_df[1:2]

my_df[1, 1:2]

my_df[2:3, 'sex']


library(tidyverse)

# filter()
# stats::filter()









