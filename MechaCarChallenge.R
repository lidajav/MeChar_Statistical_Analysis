library(dbplyr)
# Read csv file into a data frame
mechaCar_df <- read.csv(file="MechaCar_mpg.csv")

# generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
     ground_clearance+AWD, data=mechaCar_df)

# generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +
      ground_clearance+AWD, data=mechaCar_df))


# Read csv file into a data frame
psi_df <- read.csv(file="Suspension_Coil.csv")

# create summary table to get mean, median , Variance and SD of PSI
total_summary <- psi_df %>% summarize(Mean =mean(PSI),Median =median(PSI), 
                Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

# create a dataframe to group each manufacturing lot by mean, median, variance and SD of PSI
lot_summary <- psi_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean =mean(PSI),Median =median(PSI), 
                Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

# create a t-test to determine 
#if PSI across all manufacturing lots is different from population mean of 1500
t.test(psi_df$PSI , mu=1500)

# create a t-test for lot1 to determine 
# if PSI in lot1 is different from population mean of 1500
lot1 <- subset(psi_df,Manufacturing_Lot == "Lot1")
t.test(lot1$PSI , mu=1500)

# create a t-test for lot2 to determine 
# if PSI in lot2 is different from population mean of 1500
lot2 <- subset(psi_df,Manufacturing_Lot == "Lot2")
t.test(lot2$PSI , mu=1500)

# create a t-test for lot3 to determine 
# if PSI in lot3 is different from population mean of 1500
lot3 <- subset(psi_df,Manufacturing_Lot == "Lot3")
t.test(lot3$PSI , mu=1500)


