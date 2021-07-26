#Ravindra Raut
#raviraut206@gmail.com

# Correlation of Genome Size and TE Length
# Resource http://www.sthda.com/english/wiki/correlation-test-between-two-variables-in-r
####  Pearson correlation coefficients measure the linear relationship between the variables
####  Spearman correlation coefficients measure only monotonic relationships, relationship in which the 
#### variables tend to move in the same/opposite direction but not necessarily at a constant rate 
#### the rate is constant in a linear relationship. (https://www.analyticsvidhya.com/blog/2021/03/comparison-of-pearson-and-spearman-correlation-coefficients/)

if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")

library("ggpubr")


# read.csv file
my_data <- read.csv("/Users/raviraut/Downloads/PhD_work/TE01/data.csv")
head(my_data)


# Statistics
cor(my_data$Assembly_Size,my_data$TE_length, method = c("pearson", "kendall", "spearman"))
cor.test(my_data$Assembly_Size,my_data$TE_length, method=c("pearson", "kendall", "spearman"))

#Pearson correlation test
res <- cor.test(my_data$Assembly_Size,my_data$TE_length, method=c("pearson"))
res

# Extract the p.value
res$p.value

# Extract the correlation coefficient (cor)
res$estimate

#Kendall rank correlation test (tau)
res2 <- cor.test(my_data$Assembly_Size,my_data$TE_length, method=c("kendall"))
res2

#Spearman rank correlation coefficient (rho)
res3 <- cor.test(my_data$Assembly_Size,my_data$TE_length, method=c("spearman"))
res3

# Check Distribution
# Greater than 0.05. Assume Normality
shapiro.test(my_data$Assembly_Size)
shapiro.test(my_data$TE_length)

# Plot Graphs
f1 <- ggscatter(my_data, x = "Assembly_Size", y = "TE_length", fill = "Genome_Group",
                add = "reg.line", conf.int = TRUE, 
                cor.coef = TRUE, cor.method = "pearson",
                xlab = "Genome Size in Mbps", ylab = "% Coverage of Transposable Elements") 
 

f1
ggsave("f1_pearson.png")



f2 <- ggscatter(my_data, x = "Assembly_Size", y = "TE_length", fill = "Genome_Group",
                add = "reg.line", conf.int = TRUE, 
                cor.coef = TRUE, cor.method = "kendall",
                xlab = "Genome Size in Mbps", ylab = "% Coverage of Transposable Elements")

f2
ggsave("f2_kendall.png")

# I used spearman for genome dataset.
f3 <- ggscatter(my_data, x = "Assembly_Size", y = "TE_length", fill = "Genome_Group",
                add = "reg.line", conf.int = TRUE, 
                cor.coef = TRUE, cor.method = "spearman",
                xlab = "Genome Size in Mbps", ylab = "% Coverage of Transposable Elements")

f3
ggsave("f3_spearman.png")

#correlation between a given samples and the normal distribution
f4 <- ggqqplot(my_data$Assembly_Size, ylab = "Genome Size")
f4

f5 <- ggqqplot(my_data$TE_length, ylab = "TE %")
f5

f6 <- ggarrange(f4,f5,  
          labels = c("A", "B"),
          ncol = 2, nrow = 2)
f6
ggsave("f6_correlation.png")
 
f7 <- ggarrange(f1, f4,f5, labels = c("A", "B", "C"),
                ncol = 2, nrow = 2)
f7

ggsave("stat.png")
