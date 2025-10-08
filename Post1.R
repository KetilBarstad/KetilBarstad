library(tidyverse)
cyclingstudy <- read.csv("cyclingstudy.csv")
view(cyclingstudy)

#I want to explore curvilinear relationships. Age, height.T1 and VO2max?

m <- lm(VO2.ma ~ height.T1)


ggplot(cyclingstudy, aes(x = height.T1, y = VO2.max)) +
  geom_point()

m1 <- lm(VO2.max ~ height.T1, data = cyclingstudy)

m2 <- lm(VO2.max ~ height.T1 + I(age^2), data = cyclingstudy)


P2 <- ggplot(cyclingstudy, aes(x = height.T1, y = VO2.max, color = age)) +
  geom_point() +
  geom_smooth(method = "lm", , formula = y ~ x + I(x^2), 
              se = TRUE) +
  labs(
    title = "Plot of quadratic formula",
    x = "Height",
    y = "VO2-max"
  ) +
  theme_bw()

P1 <- ggplot(cyclingstudy, aes(x = height.T1, y = VO2.max)) +
      geom_point() +
    geom_smooth(method = "lm") +
  labs(
    title = "Plot of linear formula",
    x = "Height",
    y = "VO2-max"
  ) +
  theme_bw()

library(patchwork)
P1 + P2









  