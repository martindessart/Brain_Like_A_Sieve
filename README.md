# Complement data for: Habituation leads to short but not long term memory formation in mosquito larvae

Link to the publication: https://www.sciencedirect.com/science/article/abs/pii/S0022191024000386

[Martin Dessart](https://martindessart.github.io/), Miguel Piñeirúa, Claudio R. Lazzari, Fernando J. Guerrieri

[Institut de Recherche sur la Biologie de l’Insecte](https://irbi.univ-tours.fr/), UMR7261 CNRS - University de Tours, Tours, France.

# Abstract
In animals, memory allows to remember important locations and conserve energy by not responding to irrelevant stimuli. However, memory formation and maintenance are metabolically costly, making it worthwhile to understand the mechanisms underlying different types of memory and their adaptive value. In this study, we investigated the memory persistence of Aedes aegypti mosquito larvae, after habituation to a visual stimulus. We used an automated tracking system for quantifying the response of mosquito larvae to the passage of a shadow, simulating an approaching predator. First, we compared different retention times, from 4 min to 24 h, and found that mosquito larvae only exhibited memory capabilities less than 3 h after training. Secondly, we investigated the role of inter-trial intervals in memory formation. In contrast to other aquatic invertebrates, mosquito larvae showed no long-term memory even at long inter-trial intervals (i.e., 5 min and 10 min). Our results are discussed in relation to the ecological constraints.

# Folders

## 1)Data
All the csv files extracted from the videos and used for the analysis.
1.	Raw: raw files extracted directly from the software. 1 file per experiment (N = 10 individuals)
2.	Verified: detection threshold, moving average, low-pass filter, data cleaning
3.	Classified: extraction of the behavioural response of mosquito larvae during the aversive stimulus (i.e., 3 seconds x 11 trials per experiment)
4. Grouped: data are grouped per treatment

## 2)Analysis
R programs used to answer our questions.
1.	Tracking verification: detection threshold, moving average, low-pass filter, data cleaning. From “Raw” to “Verified” files.
2.	Data classification: extraction of data during stimulation. From “Verified” to “Classified” files.
3.	Group data: integrate all data from all experiments to build one dataset. From “Classified” to “Grouped” files.
4.	Analyse: code used to analyse the learning performance and answer our questions


# Dependencies
* R version 4.1.1 (2021-08-10) -- "Kick Things"
* Python 3.7.11
* Spyder 5.1.5

## Licence
This project is licensed under [MIT Licence](https://opensource.org/license/mit/).
