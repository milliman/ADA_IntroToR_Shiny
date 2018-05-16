## ---- message = F, warning = F-------------------------------------------
# install.packages(c("dplyr", "ggplot2"))
library(dplyr)
library(ggplot2)

## ------------------------------------------------------------------------
sessionInfo()$R.version$version.string
sapply(sessionInfo()$otherPkgs, function(x) x$Version)

## ------------------------------------------------------------------------
1 + 1
a <- 1 + 1

## ------------------------------------------------------------------------
v1 <- 1:3
v2 <- c(1, 2, 3)
v3 <- seq(1, 3, by = 1)
v4 <- seq(1, 3, length.out = 3)
v1
v2
v3
v4
v1*v2

## ------------------------------------------------------------------------
c1 <- c("one", "two", "three", "one", "two", "three")
c1
f1 <- factor(c("one", "two", "three", "one", "two", "three"))
f1

## ----cars----------------------------------------------------------------
m1 <- matrix(data = c(1, 2, 3, 4, 5, 6, 7, 8, 9), 
             nrow = 3, 
             ncol = 3,
             byrow = FALSE)

m2 <- matrix(data = rnorm(n = 9, mean = 0, sd = 1),
             nrow = 3,
             ncol = 3,
             byrow = TRUE)
m1 * m2
m1 %*% m2

## ------------------------------------------------------------------------
d <- data.frame(A = 1:4,
                B = c("red", "blue", "yellow", "green"))
class(d)
class(iris)
summary(iris)
str(iris)
head(iris)

## ------------------------------------------------------------------------
write.csv(x = iris, 
          file = "iris.csv",
          row.names = F)
mattysdf <- read.csv(file = "iris.csv")

## ------------------------------------------------------------------------
saveRDS(object = iris,
        file = "iris.RDS")
mattysdf <- readRDS("iris.RDS")

## ------------------------------------------------------------------------
mattysdf %>%
  select(Petal.Length, Species) %>%
  head(5)

## ------------------------------------------------------------------------
mattysnewdf <- mattysdf %>%
  filter(Species == "versicolor")

## ------------------------------------------------------------------------
mattysnewdf2 <- mattysdf %>%
  mutate(Sepal.Area = Sepal.Width*Sepal.Length,
         Petal.Area = Petal.Width*Petal.Length)

## ------------------------------------------------------------------------
mattysnewdf2 %>%
  group_by(Species) %>%
  summarize(Sepal.Area.mean = mean(Sepal.Area),
            Sepal.Area.sd = sd(Sepal.Area),
            Petal.Area.mean = mean(Petal.Area),
            Petal.Area.sd = sd(Petal.Area))

## ------------------------------------------------------------------------
plot(x = mattysnewdf2$Petal.Area,
     y = mattysnewdf2$Sepal.Area)

plot(x = mattysnewdf2$Petal.Area,
     y = mattysnewdf2$Sepal.Area,
     col = ifelse(mattysnewdf2$Species == "setosa", "red",
                  ifelse(mattysnewdf2$Species == "versicolor", "green", "blue")))

## ------------------------------------------------------------------------
hist(x = faithful$waiting,
     breaks = 20)

hist(x = faithful$waiting,
     breaks = seq(min(faithful$waiting), max(faithful$waiting), length.out = 20 + 1))

## ------------------------------------------------------------------------
mattysnewdf2 %>%
  ggplot(mapping = aes(x = Petal.Area, y = Sepal.Area)) +
  geom_point(mapping = aes(color = Species))

# More cooler scatter plot
mattysnewdf2 %>%
  ggplot(mapping = aes(x = Petal.Area, y = Sepal.Area)) +
  geom_point(mapping = aes(color = Species)) +
  geom_smooth(method = "lm")

## ------------------------------------------------------------------------
faithful %>%
  ggplot(mapping = aes(x = waiting)) +
  geom_histogram(bins = 20)

# More betterer histogram
mattysnewdf2 %>%
  ggplot(mapping = aes(x = Petal.Area)) +
  geom_histogram(mapping = aes(fill = Species),
                 bins = 20)

## ------------------------------------------------------------------------
faithful.model <- lm(formula = eruptions ~ waiting,
                     data = faithful)
summary(faithful.model)

## ------------------------------------------------------------------------
iris.model <- glm(formula = versicolor ~ Sepal.Area + Petal.Area,
                  data = mattysnewdf2 %>%
                    mutate(versicolor = ifelse(Species == "versicolor", 1, 0)),
                  family = binomial(link = "logit"))
summary(iris.model)

