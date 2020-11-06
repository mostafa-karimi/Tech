library(ggplot2)
library(svglite)
###
###---------------- Companies Grade (Monthly Average) 
###
CompaniesGradeAverage_chart <- function(df) {
  p <- ggplot(df, aes(x = 1:12, y = Grade, group = 1)) +
    geom_line(color="#0278ae", size = 1) +
    geom_point(color="#0278ae") +
    scale_x_discrete(limits = df$Month) +
    scale_y_continuous(limits=c(1, 10), breaks = c(2, 4, 6, 8, 10)) +
    xlab(NULL) +
    ylab(NULL) +
    theme(panel.border = element_blank(),
          panel.grid.major.y = element_line(colour = "lightgray"),
          panel.grid.minor = element_blank(),
          panel.background = element_blank(),
          text = element_text(family = "Open Sans"),
          axis.line.x = element_line(colour = "black"),
          axis.line.y = element_line(colour = "black"),
          axis.text.x = element_text(size = 14, angle = 45, vjust = 0.5), 
          axis.text.y = element_text(size = 14))
  ggsave(file = "companiesgradeaverage.svg", width = 5.9, height = 1.9)
}
###
###---------------- Guards Grade (Monthly Average) 
###
GuardsGradeAverage_chart <- function(df) {
  p <- ggplot(df, aes(x = 1:12, y = Grade, group = 1)) +
    geom_line(color="#0278ae", size = 1) +
    geom_point(color="#0278ae") +
    scale_x_discrete(limits = df$Month) +
    scale_y_continuous(limits=c(1, 10), breaks = c(2, 4, 6, 8, 10)) +
    xlab(NULL) +
    ylab(NULL) +
    theme(panel.border = element_blank(),
          panel.grid.major.y = element_line(colour = "lightgray"),
          panel.grid.minor = element_blank(),
          panel.background = element_blank(),
          text = element_text(family = "Open Sans"),
          axis.line.x = element_line(colour = "black"),
          axis.line.y = element_line(colour = "black"),
          axis.text.x = element_text(size = 14, angle = 45, vjust = 0.5), 
          axis.text.y = element_text(size = 14))
  ggsave(file = "guardsgradeaverage.svg", width = 5.9, height = 1.9)
}
###
###---------------- Security Events
###
SecurityEvents_chart <- function(df) {
  df$fraction <- df$count / sum(df$count)
  df$ymax <- cumsum(df$fraction)
  df$ymin <- c(0, head(df$ymax, n = -1))
  df$labelposition <- (df$ymax + df$ymin) / 2
  df$label <- df$count
  p <- ggplot(df, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = as.character(1:4))) +
    geom_rect() +
    geom_label(x = 3.5, aes(y = labelposition, label = label), size = 3, family = "Open Sans") +
    scale_fill_manual(name = "Threat",
                      labels = df$Threat, 
                      values = c("#0278ae", "#51adcf", "#a5ecd7", "#DFEEF5")) +
    coord_polar(theta = "y") +
    xlim(c(2, 4)) +
    guides(fill = guide_legend(override.aes = list(color = NULL))) +
    theme_void() +
    theme(legend.position = "right",
          text = element_text(family = "Open Sans"),
          legend.title = element_text(size = 9), 
          legend.text = element_text(size = 9))
  ggsave(file = "securityevents.svg", width = 3, height = 2)
}
###
###---------------- Security Incidents
###
SecurityIncidents_chart <- function(df) {
  df$fraction <- df$count / sum(df$count)
  df$ymax <- cumsum(df$fraction)
  df$ymin <- c(0, head(df$ymax, n = -1))
  df$labelposition <- (df$ymax + df$ymin) / 2
  df$label <- df$count
  p <- ggplot(df, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = as.character(1:4))) +
    geom_rect() +
    geom_label(x = 3.5, aes(y = labelposition, label = label), size = 3, family = "Open Sans") +
    scale_fill_manual(name = "Property",
                      labels = df$Property, 
                      values = c("#0278ae", "#51adcf", "#a5ecd7", "#DFEEF5")) +
    coord_polar(theta = "y") +
    xlim(c(2, 4)) +
    guides(fill = guide_legend(override.aes = list(color = NULL))) +
    theme_void() +
    theme(legend.position = "right",
          text = element_text(family = "Open Sans"),
          legend.title = element_text(size = 9), 
          legend.text = element_text(size = 9))
  ggsave(file = "securityincidents.svg", width = 3, height = 2)
}
###
###---------------- Companies Grade Frequency
###
CompaniesGradeFrequency_chart <- function(df) {
  df$Percentage <- round((df$Count / sum(df$Count)) * 100)
  dft <- data.frame(Grade = rep(df$Grade, 2), 
                    Percentage = c(df$Percentage, rep(100, 5) - df$Percentage), 
                    Group = rep(c("2", "1"), each = 5))
  p <- ggplot(dft, aes(x = Grade, y = Percentage, fill = Group)) +
    geom_bar(position="stack", stat = "identity") +
    geom_text(aes(label = paste(Percentage, "%", sep = "")), vjust = -1, color = "black", 
              size = 3, family = "Open Sans", position = "stack") +
    scale_fill_manual(values = c("#a5ecd7", "#0278ae")) +
    xlab(NULL) +
    ylab(NULL) +
    theme(legend.position = "none") +
    theme(
      panel.border = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      text = element_text(family = "Open Sans"),
      axis.ticks.x = element_blank(),
      axis.line.y = element_line(colour = "black")
    )
  ggsave(file = "companiesgradefrequency.svg", width = 3, height = 2)
}
###
###---------------- Guards Grade Frequency
###
GuardsGradeFrequency_chart <- function(df) {
  df$Percentage <- round((df$Count / sum(df$Count)) * 100)
  dft <- data.frame(Grade = rep(df$Grade, 2), 
                    Percentage = c(df$Percentage, rep(100, 5) - df$Percentage), 
                    Group = rep(c("2", "1"), each = 5))
  p <- ggplot(dft, aes(x = Grade, y = Percentage, fill = Group)) +
    geom_bar(position="stack", stat = "identity") +
    geom_text(aes(label = paste(Percentage, "%", sep = "")), vjust = -1, color = "black", 
              size = 3, family = "Open Sans", position = "stack") +
    scale_fill_manual(values = c("#a5ecd7", "#0278ae")) +
    xlab(NULL) +
    ylab(NULL) +
    theme(legend.position = "none") +
    theme(
      panel.border = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      text = element_text(family = "Open Sans"),
      axis.ticks.x = element_blank(),
      axis.line.y = element_line(colour = "black")
    )
  ggsave(file = "guardsgradefrequency.svg", width = 3, height = 2)
}
###
###---------------- Performance Frequency
###
PerformanceFrequency_chart <- function(df1, df2) {
  df1$Percentage <- round((df1$Count / sum(df1$Count)) * 100)
  df2$Percentage <- round((df2$Count / sum(df2$Count)) * 100)
  dft <- data.frame(Performance = c(df1$Performance, df2$Performance), 
                    Percentage = c(df1$Percentage, df2$Percentage), 
                    Group = rep(c("Companies", "Guards"), each = 3))
  p <- ggplot(dft, aes(x = Group, y = Percentage, fill = as.character(c(1:3, 1:3)))) +
    geom_bar(position="dodge", stat = "identity") +
    geom_text(aes(label = paste(Percentage, "%", sep = "")), 
              position = position_dodge(width = 0.9), vjust = -1, color = "black", 
              size = 3, family = "Open Sans") +
    xlab(NULL) +
    ylab(NULL) +
    scale_y_continuous(limits=c(0, 100)) +
    scale_fill_manual(name = "Performance",
                      labels = df1$Performance, 
                      values = c("#a5ecd7", "#51adcf", "#0278ae")) +
    guides(fill = guide_legend(reverse=TRUE), override.aes = list(color = NULL)) +
    theme(
      panel.border = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      axis.ticks.x = element_blank(),
      axis.line.y = element_line(colour = "black"),
      text = element_text(family = "Open Sans"),
      legend.title = element_text(size = 9), 
      legend.text = element_text(size = 9)
    )
  ggsave(file = "performancefrequency.svg", width = 3, height = 2)
}
###
###---------------- Service Satisfaction
###
ServiceSatisfaction_chart <- function(df) {
  df$fraction <- df$count / sum(df$count)
  df$ymax <- cumsum(df$fraction)
  df$ymin <- c(0, head(df$ymax, n = -1))
  df$labelposition <- (df$ymax + df$ymin) / 2
  df$label <- df$count
  p <- ggplot(df, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = as.character(1:4))) +
    geom_rect() +
    geom_label(x = 3.5, aes(y = labelposition, label = paste(round(fraction, 2) * 100, "%", sep = "")), 
                size = 3, family = "Open Sans") +
    coord_polar(theta = "y") +
    scale_fill_manual(name = "Rate",
                      labels = df$Rate, 
                      values = c("#DFEEF5", "#a5ecd7", "#51adcf", "#0278ae")) +
    guides(fill = guide_legend(reverse=TRUE, override.aes = list(color = NULL))) +
    theme_void() +
    theme(legend.position = "right",
          text = element_text(family = "Open Sans"),
          legend.title = element_text(size = 9), 
          legend.text = element_text(size = 9))
  ggsave(file = "servicesatisfaction.svg", width = 3, height = 2)
}