#########
## Andrea
## 2020-07-10
## Generate a barplot with multiple species
## Requieres CSV file


## 
# Plot species comparison


# Install library

library(ggplot2)

# Set root directory and working directory


root_dir = "H:/Copenhagen/Projects/Global_Bowhead_whale/NucleotideDiversity/Plot_comparison"
setwd("H:/Copenhagen/Projects/Global_Bowhead_whale/NucleotideDiversity/Plot_comparison")


# Read CSV file 
mydata = read.csv("Genetic_diversity_species_comparison.csv")  # read csv file 


#Reorder legend labels

#Default order
levels(mydata$Species)

# specify the factor levels in the order you want
mydata$Species <- factor(mydata$Species, levels = c("Balaena mysticetus", "Hyperoodon ampullatus", "Monodon monocerus", "Delphinopterus leucas",
                                                    "Physeter macrocephalus", "Globicephala macrorhynchus", "Orcinus orca",
                                                    "Tursiops truncatus","Stenella longirostris","Stenella attenuata"))    

# Default bar plot
p<- ggplot(mydata, aes(x=Species, y=ND, fill=Species)) + 
  geom_bar(stat="identity", color="black", 
           position=position_dodge()) +
  geom_errorbar(aes(ymin=ND-ND.SD, ymax=ND+ND.SD), width=.2,
                position=position_dodge(.9)) 
print(p)


# Default bar plot
p<- ggplot(mydata, aes(x=Species, y=ND.G, fill=Species)) + 
  geom_bar(stat="identity", color="black", 
           position=position_dodge())
  # + geom_errorbar(aes(ymin=ND-ND.SD, ymax=ND+ND.SD), width=.2,
   #             position=position_dodge(.9)) 
print(p)

# Finished bar plot

pdf("Species_nucleotide_diversity.pdf", width = 18,  height = 10)
p+labs(title="", x="", y = "Nucleotide diversity")+
  theme(panel.background = element_blank(), text = element_text(size=18), axis.line = element_line(color="black", size = 1),
        axis.text.x = element_text(angle = 85, vjust = 0.9, hjust=0.95, face = "italic"))
        #+ geom_text(aes(label='stat(count)'),  stat='count',  nudge_y=0.125,  va='bottom')
dev.off()

