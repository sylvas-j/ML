data<-read.csv("D:\\desktop files\\weka\\weka precision1.csv")
data2<-read.csv("D:\\desktop files\\weka\\WISDM_ar_latest\\myWISDM.csv")
data2
library(ggplot2)
library(gridExtra)
library(patchwork)
library(viridis)
library(hrbrthemes)
library(forcats)


df <- data.frame(	Standing = c("TP_Rate","FP_Rate","Precision","Recall","F_Measure","MCC","ROC_Area","PRC_Area"),
		     	Stnum = c(0.968,0.009,0.962,0.968,0.965,0.957,0.981,0.938),
			Sitting = c("TP_Rate","FP_Rate","Precision","Recall","F_Measure","MCC","ROC_Area","PRC_Area"),
		     	Snum = c(0.959,0.008,0.964,0.959,0.961,0.953,0.975,0.936),
			Laying = c("TP_Rate","FP_Rate","Precision","Recall","F_Measure","MCC","ROC_Area","PRC_Area"),
			Lnum = c(0.999,0.000,1.000,0.999,0.999,0.999,1.000,0.999),
			Walking = c("TP_Rate","FP_Rate","Precision","Recall","F_Measure","MCC","ROC_Area","PRC_Area"),
			Wnum = c(0.999,0.000,0.999,0.999,0.999,0.999,0.999,0.998),
			WalkingD = c("TP_Rate","FP_Rate","Precision","Recall","F_Measure","MCC","ROC_Area","PRC_Area"),
			Wdnum = c(0.998,0.000,0.999,0.998,0.998,0.998,0.999,0.997),
			WalkingU = c("TP_Rate","FP_Rate","Precision","Recall","F_Measure","MCC","ROC_Area","PRC_Area"),
			Wunum = c(1.000,0.000,0.998,1.000,0.999,0.999,1.000,0.998),
		     	fill = c("TP","FP","Precision","Recall","F","MCC","ROC","PRC"))


g1 <- ggplot(data=df, aes(Standing)) +geom_bar(aes(y = Stnum, fill=fill), stat= "identity")+geom_text(aes(label = Stnum), nudge_y= -0.05,color="white", stat="count", vjust = -.25)+coord_flip() +ggtitle("A g1 grsph for summary base on each activity - rotated x-axis")
g2 <- ggplot(data=df, aes(Sitting)) + geom_bar(width = 1, aes(y = Snum, fill=fill), stat= "identity")+
		geom_text(aes(label = Snum), stat="count", vjust = -.25)+ theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5)) + labs(title = "Distribution of Adults by Income in Dayton, OH",
             subtitle = "The percentage of adults in the middle class eroded by 5.3% from 2000 to 2014. Although a small \nfraction of these individuals moved into the upper class (+0.5%), the majority of these middle class \nindividuals moved into the lower income class (+4.8%).",
             caption = "Source: Pew Research Center analysis of the \n2000 decennial census and 2014 American \nCommunity Survey (IPUMS)")
g1 / g2
grid.arrange(g1, g2, nrow = 2)




df1 <- data.frame(head = c("TP_Rate","FP_Rate","Precision","Recall","F_Measure","MCC","ROC_Area","PRC_Area"),
			class = c("STANDING","SITTING","LAYING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS","ROC","PRC"),
		     	Stnum = c(0.968,0.009,0.962,0.968,0.965,0.957,0.981,0.938),
		     	Snum = c(0.959,0.008,0.964,0.959,0.961,0.953,0.975,0.936),
			Lnum = c(0.999,0.000,1.000,0.999,0.999,0.999,1.000,0.999),
			Wnum = c(0.999,0.000,0.999,0.999,0.999,0.999,0.999,0.998),
			Wdnum = c(0.998,0.000,0.999,0.998,0.998,0.998,0.999,0.997),
			Wunum = c(1.000,0.000,0.998,1.000,0.999,0.999,1.000,0.998))
df1_bar <- ggplot(data = df1, aes(x=head, y = (Stnum), fill = head)) + geom_bar(width=1,color = "gray", stat="identity", aes(fill=head))
df1_bar <- df1_bar + geom_text(aes(label = Stnum), nudge_y= -0.05,color="white", stat="identity", vjust = .25) + coord_flip() +ggtitle("Fig. A: Default rotated x-axis")
df1_bar


df_bar <- ggplot(data = df, aes(x=Standing, y = (Stnum) fill=fill)) + geom_bar(stat="identity", aes(fill=fill))
df_bar1 <- ggplot(data = df, aes(x=Sitting, y = Snum, fill=fill)) + geom_bar(stat="identity", aes(fill=fill))
grid.arrange(df_bar, df_bar1, nrow = 1)

df3 <- data.frame(head = c("standing","standing","standing","standing","standing","standing","standing","standing",
				"sitting","sitting","sitting","sitting","sitting","sitting","sitting","sitting",
				"laying","laying","laying","laying","laying","laying","laying","laying",
				"walking","walking","walking","walking","walking","walking","walking","walking",
				"walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs",
				"walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs"),
		measures = c("TP Rate","FP Rate","Precision","Recall","F-measure","MCC","ROC Area","PRC Area",
				"TP Rate","FP Rate","Precision","Recall","F-measure","MCC","ROC Area","PRC Area",
				"TP Rate","FP Rate","Precision","Recall","F-measure","MCC","ROC Area","PRC Area",
				"TP Rate","FP Rate","Precision","Recall","F-measure","MCC","ROC Area","PRC Area",
				"TP Rate","FP Rate","Precision","Recall","F-measure","MCC","ROC Area","PRC Area",
				"TP Rate","FP Rate","Precision","Recall","F-measure","MCC","ROC Area","PRC Area"),
		values = c(0.968,0.009,0.962,0.968,0.965,0.957,0.981,0.938,
				0.959,0.008,0.964,0.959,0.961,0.953,0.975,0.936,
				0.999,0.000,1.000,0.999,0.999,0.999,1.000,0.999,
				0.999,0.000,0.999,0.999,0.999,0.999,0.999,0.998,
				0.998,0.000,0.999,0.998,0.998,0.998,0.999,0.997,
				1.000,0.000,0.998,1.000,0.999,0.999,1.000,0.998
				))
#df3

gt3 <- ggplot(data=df3, aes(head, values, fill = measures)) +
        geom_bar(stat = "identity",position= position_dodge(0.7), color = "grey40") +
        ggtitle("KNN Result graph")


gt3 <- gt3 + ylim(0,1) + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
gt3

gt1 <- ggplot(data=df3, aes(factor(head), values, fill = factor(measures))) +
        geom_bar(stat = "identity", position = "dodge") +
        ggtitle("Default color comparison")
+geom_text(aes(label = values), nudge_y= -0.05, stat="identity")


# more pleasing colors
gt2 <- ggplot(data=df3, aes(factor(head), values, fill = factor(measures))) +
        geom_bar(stat = "identity", position = "dodge", color = "grey40") +
        scale_fill_brewer(palette = "Pastel1") +
        ggtitle("Adjusted color comparison")
+ geom_text(aes(label = values), nudge_y= -0.05, stat="identity")

grid.arrange(gt1, gt2, nrow = 2)





p1 <- qplot(mpg, wt, data = mtcars, colour = cyl)
p2 <- qplot(mpg, data = mtcars) + ggtitle("title")
p3 <- qplot(mpg, data = mtcars, geom = "dotplot")
p4 <-
  p1 + facet_wrap( ~ carb, nrow = 1) + theme(legend.position = "none") +
  ggtitle("facetted plot")
grid.arrange(p1, p2,p3,p4, nrow = 2)



x  <- seq(-2, 2, 0.05)
y1 <- pnorm(x)
y2 <- pnorm(x, 1, 1)
geom_bar(aes(x), y1, type = "l", col = "red")
par(new=TRUE)
lines(x, y2, col = "green")


# Grouped Bar Plot
counts <- table(df$Snum, df$Lnum)
geom_bar(counts, aes(x=count, y=head), main="Car Distribution by Gears and VS",
  xlab="Number of Gears", col=c("darkblue","red"),
  legend = rownames(counts), beside=TRUE)

########################################
# Another graph on six classifiers with
# precision(summary) plotted against the activities.

df4 <- data.frame(classifiers = c("RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",						
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes"),
			activities = c("Standing","Standing","Standing","Standing","Standing","Standing",
						"Sitting","Sitting","Sitting","Sitting","Sitting","Sitting",
						"laying","laying","laying","laying","laying","laying",
						"walking","walking","walking","walking","walking","walking",
						"walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs",
						"walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs"),
			precisions = c(0.861,0.962,0.949,0.962,0.949,0.806,
						0.817,0.969,0.954,0.964,0.951,0.579,
						0.961,0.999,1.000,1.000,1.000,0.934,
						0.914,0.997,0.953,0.999,0.983,0.931,
						0.902,0.989,0.944,0.999,0.986,0.789,
						0.899,0.988,0.941,0.998,0.976,0.702),
			TP_Rate = c(0.846,0.972,0.959,0.968,0.954,0.746,
						0.832,0.957,0.945,0.959,0.944,0.769,
						0.959,0.999,0.999,0.999,0.998,0.697,
						0.929,0.993,0.953,0.999,0.983,0.733,
						0.899,0.989,0.937,0.998,0.976,0.790,
						0.889,0.993,0.948,1.000,0.991,0.897),
			Recall = c(0.846,0.973,0.959,0.968,0.954,0.746,
						0.832,0.957,0.945,0.959,0.944,0.769,
						0.959,0.999,0.999,0.999,0.998,0.697,
						0.929,0.993,0.953,0.999,0.983,0.733,
						0.899,0.989,0.937,0.998,0.976,0.790,
						0.889,0.993,0.948,1.000,0.991,0.897),
			F_Measure = c(0.854,0.967,0.954,0.965,0.952,0.775,
						0.825,0.963,0.950,0.961,0.948,0.661,
						0.960,0.999,1.000,0.999,0.999,0.798,
						0.922,0.995,0.953,0.999,0.983,0.820,
						0.900,0.989,0.940,0.998,0.981,0.790,
						0.894,0.991,0.944,0.999,0.983,0.788))


df4

gt4 <- ggplot(data=df4, aes(factor(activities), precisions, fill = factor(classifiers))) +
        geom_bar(stat = "identity",position= position_dodge(0.7), color = "grey40") +
        ggtitle("Six Classifiers Precisions graph") + scale_fill_brewer(palette = "Set2")
gt4 <- gt4 + ylim(0,1) + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
gt4

gt5 <- ggplot(data=df4, aes(factor(activities), TP_Rate, fill = factor(classifiers))) +
        geom_bar(stat = "identity",position= position_dodge(0.7), color = "grey40") +
        ggtitle("Six Classifiers TP Rate graph") + scale_fill_brewer(palette = "Set2")
gt5 <- gt5 + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
gt5

gt6 <- ggplot(data=df4, aes(factor(activities), Recall, fill = factor(classifiers))) +
        geom_bar(stat = "identity",position= position_dodge(0.7), color = "grey40") +
        ggtitle("Six Classifiers Recall graph") + scale_fill_brewer(palette = "Set2")
gt6 <- gt6 + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
gt6

gt7 <- ggplot(data=df4, aes(factor(activities), F_Measure, fill = factor(classifiers))) +
        geom_bar(stat = "identity",position= position_dodge(0.7), color = "grey40") +
        ggtitle("Six Classifiers F_Measure graph") + scale_fill_brewer(palette = "Set2")
gt7 <- gt7 + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
gt7

df5 <- data.frame(classifiers = c("RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",						
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes"),
			activities = c("Standing","Standing","Standing","Standing","Standing","Standing",
						"Sitting","Sitting","Sitting","Sitting","Sitting","Sitting",
						"laying","laying","laying","laying","laying","laying",
						"walking","walking","walking","walking","walking","walking",
						"walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs",
						"walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs"),
			TP_Rate = c(0.846,0.972,0.959,0.968,0.954,0.746,
						0.832,0.957,0.945,0.959,0.944,0.769,
						0.959,0.999,0.999,0.999,0.998,0.697,
						0.929,0.993,0.953,0.999,0.983,0.733,
						0.899,0.989,0.937,0.998,0.976,0.790,
						0.889,0.993,0.948,1.000,0.991,0.897))



TP Rate = c(0.846,0.972,0.959,0.968,0.954,0.746,
0.832,0.957,0.945,0.959,0.944,0.769,
0.959,0.999,0.999,0.999,0.998,0.697,
0.929,0.993,0.953,0.999,0.983	0.733,
0.899,0.989,0.937,0.998,0.976,0.790,
0.889,0.993,0.948,1.000,0.991,0.897)


Recall = c(0.846,0.973,0.959,0.968,0.954,0.746,
0.832,0.957,0.945,0.959,0.944,0.769,
0.959,0.999,0.999,0.999,0.998,0.697,
0.929,0.993,0.953,0.999,0.983,0.733,
0.899,0.989,0.937,0.998,0.976,0.790,
0.889,0.993,0.948,1.000,0.991,0.897)

F-Measure = c(0.854,0.967,0.954,0.965,0.952,0.775,
0.825,0.963,0.950,0.961,0.948,0.661,
0.960,0.999,1.000,0.999,0.999,0.798,
0.922,0.995,0.953,0.999,0.983,0.820,
0.900,0.989,0.940,0.998,0.981,0.790,
0.894,0.991,0.944,0.999,0.983,0.788)


#
########################################
# From 20 features gotten from ReliefAttributeEval
# selections classifiers

# Another graph on six classifiers with
# precision(summary) plotted against the activities.

df6 <- data.frame(classifiers = c("RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",						
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes"),
			activities = c("Standing","Standing","Standing","Standing","Standing","Standing",
						"Sitting","Sitting","Sitting","Sitting","Sitting","Sitting",
						"laying","laying","laying","laying","laying","laying",
						"walking","walking","walking","walking","walking","walking",
						"walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs","walking_downstairs",
						"walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs","walking_upstairs"),

		CORRELATION_precision = c(0.567,0.661,0.585,0.557,0.635,0.414,
						0.461,0.567,0.485,0.467,0.551,0.350,
						0.645,0.745,0.674,0.668,0.715,0.361,
						0.846,0.934,0.880,0.909,0.928,0.672,
						0.812,0.921,0.847,0.934,0.899,0.652,
						0.761,0.894,0.808,0.883,0.887,0.631),
		INFOGAIN_precision = c (0.869,0.909,0.907,0.900,0.887,0.669,
						0.818,0.873,0.844,0.880,0.867,0.491,
						0.938,0.970,0.955,0.968,0.958,0.899,
						0.902,0.943,0.917,0.924,0.932,0.698,
						0.899,0.950,0.913,0.941,0.950,0.849,
						0.875,0.949,0.875,0.937,0.945,0.648),
			PCA_precision = c(0.753,0.811,0.754,0.787,0.801,0.732,
						0.676,0.837,0.739,0.763,0.800,0.804,
						0.944,0.980,0.960,0.988,0.979,0.968,
						0.879,0.963,0.889,0.956,0.928,0.873,
						0.854,0.961,0.871,0.967,0.927,0.786,
						0.844,0.958,0.875,0.940,0.942,0.774),
			UCI_precision = c(0.861,0.962,0.949,0.962,0.949,0.806,
						0.817,0.969,0.954,0.964,0.951,0.579,
						0.961,0.999,1.000,1.000,1.000,0.934,
						0.914,0.997,0.953,0.999,0.983,0.931,
						0.902,0.989,0.944,0.999,0.986,0.789,
						0.899,0.988,0.941,0.998,0.976,0.702))



#
#
df6

gt6_Relief <- ggplot(data=df6, aes(factor(activities), precisions_RELIEF, fill = factor(classifiers))) +
        geom_bar(stat = "identity",position= position_dodge(0.7), color = "grey40") +
        ggtitle("ReliefAttributeEval Feature Selector Classifier(Precisions) graph") + scale_fill_brewer(palette = "Set2")
gt6_Relief <- gt6_Relief + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
gt6_Relief

gt6_Cor <- ggplot(data=df6, aes(factor(activities), CORRELATION_precision, fill = factor(classifiers))) +
        geom_bar(stat = "identity",position= position_dodge(0.7), color = "grey40") +
        ggtitle("CorrelationAttributeEval Feature Selector Classifier(Precisions) graph") + scale_fill_brewer(palette = "Set2")
gt6_Cor <- gt6_Cor + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
gt6_Cor

gt6_Relief + gt6_Cor

gt6_Info <- ggplot(data=df6, aes(factor(activities), INFOGAIN_precision, fill = factor(classifiers))) +
        geom_bar(stat = "identity",position= position_dodge(0.7), color = "grey40") +
        ggtitle("InfoGainAttributeEval Feature Selector Classifier(Precisions) graph") + scale_fill_brewer(palette = "Set2")
gt6_Info <- gt6_Info + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
gt6_Info

gt6_Pca <- ggplot(data=df6, aes(factor(activities), PCA_precision, fill = factor(classifiers))) +
        geom_bar(stat = "identity",position= position_dodge(0.7), color = "grey40") +
        ggtitle("PrincipalComponents Feature Selector Classifier(Precisions) graph") + scale_fill_brewer(palette = "Set2")
gt6_Pca <- gt6_Pca + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
gt6_Pca

gt6_UCI <- ggplot(data=df6, aes(factor(activities), UCI_precision, fill = factor(classifiers))) +
        geom_bar(stat = "identity",position= position_dodge(0.7), color = "grey40") +
        ggtitle("UCI Dataset Six Classifier(Precisions) graph") + scale_fill_brewer(palette = "Set2")
gt6_UCI <- gt6_UCI + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
gt6_UCI


#########################################################################################
# This a graph of Precisions against Classifiers of the different four feature selectors.
###########################################

df7 <- data.frame(classifiers = c("RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",						
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes",
						"RandomTree","Random_Forest","J48","IBk(KNN)","ClassificationViaRegression","NaiveBayes"),
			activities = c("ReliefAttributeEval","ReliefAttributeEval","ReliefAttributeEval","ReliefAttributeEval","ReliefAttributeEval","ReliefAttributeEval",
						"CorrelatioAttributeEval","CorrelatioAttributeEval","CorrelatioAttributeEval","CorrelatioAttributeEval","CorrelatioAttributeEval","CorrelatioAttributeEval",
						"InfoGainAttributeEval","InfoGainAttributeEval","InfoGainAttributeEval","InfoGainAttributeEval","InfoGainAttributeEval","InfoGainAttributeEval",
						"PrincipalComponents","PrincipalComponents","PrincipalComponents","PrincipalComponents","PrincipalComponents","PrincipalComponents"),
			precisions_avg = c(0.929,0.970,0.939,0.952,0.954,0.832,
						0.670,0.777,0.702,0.719,0.755,0.499,
						0.879,0.929,0.904,0.924,0.922,0.709,
						0.824,0.915,0.847,0.896,0.893,0.826))
df7

gt7_Comb<- ggplot(data=df7, aes(factor(activities), precisions_avg, fill = factor(classifiers))) +
        geom_bar(stat = "identity",position= position_dodge(0.7), color = "grey40") +
        ggtitle("Four Feature Selectors Precision Graph(Six Classifiers)") + scale_fill_brewer(palette = "Set2")
gt7_Comb <- gt7_Comb + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5))
gt7_Comb

############################################################
# This area for histogram graph

hist(df1, 
     main="Histogram for Air Passengers", 
     xlab="Stnum", 
     border="blue", 
     col="green",
     xlim=c(0,1),
     las=1, 
     breaks=5)






###############################
#Just for future reference FROM df6

#			TP_Rate = c(	0.934,0.956,0.934,0.929,0.940,0.926,
#						0.924,0.960,0.931,0.911,0.937,0.645,
##
#						0.905,0.970,0.921,0.969,0.948,0.778,
#						0.914,0.963,0.915,0.960,0.958,0.828,
##
#			FP_Rate = c(	0.016,0.008,0.015,0.019,0.013,0.073,
#						0.015,0.010,0.015,0.016,0.014,0.016,
##
#						0.021,0.007,0.017,0.010,0.011,0.052,
###
#						0.017,0.005,0.015,0.007,0.009,0.037),
#
#			Recall = c(		0.934,0.956,0.934,0.929,0.940,0.926,
#						0.924,0.960,0.931,0.911,0.937,0.645,
#						0.999,1.000,0.999,1.000,0.999,0.999,
#						0.905,0.970,0.921,0.969,0.948,0.778,
#						0.914,0.963,0.915,0.960,0.958,0.828,
#						0.879,0.964,0.916,0.939,0.937,0.738),
#
#			F_Measure = c(	0.931,0.959,0.935,0.923,0.941,0.825,
#						0.926,0.957,0.930,0.917,0.936,0.749,
#						0.999,1.000,0.999,1.000,1.000,0.994,
#						0.900,0.968,0.918,0.960,0.947,0.764,
#						0.909,0.962,0.919,0.960,0.951,0.823,
#						0.888,0.967,0.915,0.950,0.943,0.756
						))
