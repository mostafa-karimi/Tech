rm(list = ls())
###------------------------------------------------ Packages
library(ggplot2)
library(svglite)
library(htmltools)
###
###------------------------------------------------ Data
###
# companies.data <- load(DATA\companies-data.csv)
###
###------------------------------------------------ Row 1 Col 1
###

###
###------------------------------------------------ Row 1 Col 2
###
dfr1c2 <- data.frame(Month = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
                     Grade = c(5.6, 6.3, 7.7, 7.1, 7.5, 4.3, 
                               3.9, 5.5, 5.1, 7.6, 6.2, 7.4))
p <- ggplot(dfr1c2, aes(x = 1:12, y = Grade, group = 1)) +
  geom_line(color="#0278ae", size = 1) +
  geom_point(color="#0278ae") +
  scale_x_discrete(limits = dfr1c2$Month) +
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
ggsave(file = "HTML/Charts/home-r1c2.svg", width = 5.9, height = 1.9)
###
###------------------------------------------------ Row 1 Col 3
###

###
###------------------------------------------------ Row 1 Col 4
###
dfr1c4 <- data.frame(Month = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
                     Grade = c(4.2, 6.3, 5.5, 7.1, 7.5, 6.7, 
                               5.8, 6.3, 5.1, 4.6, 7.7, 6.0))
p <- ggplot(dfr1c4, aes(x = 1:12, y = Grade, group = 1)) +
  geom_line(color="#0278ae", size = 1) +
  geom_point(color="#0278ae") +
  scale_x_discrete(limits = dfr1c4$Month) +
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
ggsave(file = "HTML/Charts/home-r1c4.svg", width = 5.9, height = 1.9)
###
###------------------------------------------------ Row 2 Col 1
###
dfr2c1 <- data.frame(Threat = c("Theft", "Vandalism", "Sabotage", "Assault"),
                     Count = c(15, 8, 12, 2))
dfr2c1$fraction <- dfr2c1$Count / sum(dfr2c1$Count)
dfr2c1$ymax <- cumsum(dfr2c1$fraction)
dfr2c1$ymin <- c(0, head(dfr2c1$ymax, n = -1))
dfr2c1$labelposition <- (dfr2c1$ymax + dfr2c1$ymin) / 2
dfr2c1$label <- dfr2c1$Count
p <- ggplot(dfr2c1, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = as.character(1:4))) +
  geom_rect() +
  geom_label(x = 3.5, aes(y = labelposition, label = label), size = 3, family = "Open Sans") +
  scale_fill_manual(name = "Threat",
                    labels = dfr2c1$Threat, 
                    values = c("#0278ae", "#51adcf", "#a5ecd7", "#DFEEF5")) +
  coord_polar(theta = "y") +
  xlim(c(2, 4)) +
  guides(fill = guide_legend(override.aes = list(color = NULL))) +
  theme_void() +
  theme(legend.position = "right",
        text = element_text(family = "Open Sans"),
        legend.title = element_text(size = 9), 
        legend.text = element_text(size = 9))
ggsave(file = "HTML/Charts/home-r2c1.svg", width = 3, height = 2)
###
###------------------------------------------------ Row 2 Col 2
###
dfr2c2 <- data.frame(Property = c("Residential", "Commercial", "Industrial", "Land"),
                     Count = c(87, 65, 23, 8))
dfr2c2$fraction <- dfr2c2$Count / sum(dfr2c2$Count)
dfr2c2$ymax <- cumsum(dfr2c2$fraction)
dfr2c2$ymin <- c(0, head(dfr2c2$ymax, n = -1))
dfr2c2$labelposition <- (dfr2c2$ymax + dfr2c2$ymin) / 2
dfr2c2$label <- dfr2c2$Count
p <- ggplot(dfr2c2, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = as.character(1:4))) +
  geom_rect() +
  geom_label(x = 3.5, aes(y = labelposition, label = label), size = 3, family = "Open Sans") +
  scale_fill_manual(name = "Property",
                    labels = dfr2c2$Property, 
                    values = c("#0278ae", "#51adcf", "#a5ecd7", "#DFEEF5")) +
  coord_polar(theta = "y") +
  xlim(c(2, 4)) +
  guides(fill = guide_legend(override.aes = list(color = NULL))) +
  theme_void() +
  theme(legend.position = "right",
        text = element_text(family = "Open Sans"),
        legend.title = element_text(size = 9), 
        legend.text = element_text(size = 9))
ggsave(file = "HTML/Charts/home-r2c2.svg", width = 3, height = 2)
###
###------------------------------------------------ Row 2 Col 3
###
dfr2c3 <- data.frame(Property = c("No. of Companies", "No. of Guards", "No. of Properties", 
                                  "Security Events", "Security Incidents", "Security Defects"),
                     Count = c(323, 2178, 442, 118, 46, 23))
tabler2c3 <- withTags(
  table(HTML(
    "<style>
      table {
        font-family: Open Sans;
        font-size: 12px;
        border-collapse: collapse;
      } 
      .colhead1 {
        width: 100%;
        border-bottom: 1.5px solid black;
        text-align: left;
        padding-left: 10px;
      } 
      .colhead2 {
        width: 100%;
        border-bottom: 1.5px solid black;
        text-align: right;
        padding-right: 10px;
      }
      .colcell1 {
        text-align: left;
        padding-left: 10px;
      }
      .colcell2 {
        text-align: right;
        padding-right: 10px;
      }
      .rowcell {
        height: 25px;
      }
      </style>"),
    tr(class="rowcell", style="background: #0278ae; color: #ffffff;",
       th(class="colhead1", "Source"),
       th(class="colhead2", "Counts")
    ),
    tr(class="rowcell",
       td(class="colcell1", dfr2c3[1, 1]),
       td(class="colcell2", dfr2c3[1, 2])
    ),
    tr(class="rowcell", style="background: #DFEEF5;",
       td(class="colcell1", dfr2c3[2, 1]),
       td(class="colcell2", dfr2c3[2, 2])
    ),
    tr(class="rowcell",
       td(class="colcell1", dfr2c3[3, 1]),
       td(class="colcell2", dfr2c3[3, 2])
    ),
    tr(class="rowcell", style="background: #DFEEF5;",
       td(class="colcell1", dfr2c3[4, 1]),
       td(class="colcell2", dfr2c3[4, 2])
    ),
    tr(class="rowcell",
       td(class="colcell1", dfr2c3[5, 1]),
       td(class="colcell2", dfr2c3[5, 2])
    ),
    tr(class="rowcell", style="background: #DFEEF5;",
       td(class="colcell1", dfr2c3[6, 1]),
       td(class="colcell2", dfr2c3[6, 2])
    )
  ))
save_html(tabler2c3, file = file.path(normalizePath(dirname("HTML/Tables/home-r2c3.html")), 
                                      basename("HTML/Tables/home-r2c3.html")))
###
###------------------------------------------------ Row 2 Col 4
###
dfr2c4 <- data.frame(Property = c("Applied", "Trained", "Recruited", 
                                  "Appreciated", "Reprimanded", "Discharged"),
                     Count = c(758, 721, 633, 5, 12, 7))
tabler2c4 <- withTags(
  table(HTML(
    "<style>
      table {
        font-family: Open Sans;
        font-size: 12px;
        border-collapse: collapse;
      } 
      .colhead1 {
        width: 100%;
        border-bottom: 1.5px solid black;
        text-align: left;
        padding-left: 10px;
      } 
      .colhead2 {
        width: 100%;
        border-bottom: 1.5px solid black;
        text-align: right;
        padding-right: 10px;
      }
      .colcell1 {
        text-align: left;
        padding-left: 10px;
      }
      .colcell2 {
        text-align: right;
        padding-right: 10px;
      }
      .rowcell {
        height: 25px;
      }
      </style>"),
    tr(class="rowcell", style="background: #0278ae; color: #ffffff;",
       th(class="colhead1", "Guards"),
       th(class="colhead2", "Counts")
    ),
    tr(class="rowcell",
       td(class="colcell1", dfr2c4[1, 1]),
       td(class="colcell2", dfr2c4[1, 2])
    ),
    tr(class="rowcell", style="background: #DFEEF5;",
       td(class="colcell1", dfr2c4[2, 1]),
       td(class="colcell2", dfr2c4[2, 2])
    ),
    tr(class="rowcell",
       td(class="colcell1", dfr2c4[3, 1]),
       td(class="colcell2", dfr2c4[3, 2])
    ),
    tr(class="rowcell", style="background: #DFEEF5;",
       td(class="colcell1", dfr2c4[4, 1]),
       td(class="colcell2", dfr2c4[4, 2])
    ),
    tr(class="rowcell",
       td(class="colcell1", dfr2c4[5, 1]),
       td(class="colcell2", dfr2c4[5, 2])
    ),
    tr(class="rowcell", style="background: #DFEEF5;",
       td(class="colcell1", dfr2c4[6, 1]),
       td(class="colcell2", dfr2c4[6, 2])
    )
  ))
save_html(tabler2c4, file = file.path(normalizePath(dirname("HTML/Tables/home-r2c4.html")), 
                                      basename("HTML/Tables/home-r2c4.html")))
###
###------------------------------------------------ Row 3 Col 1
###
dfr3c1 <- data.frame(Grade = c("1-2", "3-4", "5-6", "7-8", "9-10"),
                     Count = c(8, 21, 85, 41, 5))
dfr3c1$Percentage <- round((dfr3c1$Count / sum(dfr3c1$Count)) * 100)
dft <- data.frame(Grade = rep(dfr3c1$Grade, 2), 
                  Percentage = c(dfr3c1$Percentage, rep(100, 5) - dfr3c1$Percentage), 
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
ggsave(file = "HTML/Charts/home-r3c1.svg", width = 3, height = 2)
###
###------------------------------------------------ Row 3 Col 2
###
dfr3c2 <- data.frame(Grade = c("1-2", "3-4", "5-6", "7-8", "9-10"),
                     Count = c(121, 518, 585, 241, 35))
dfr3c2$Percentage <- round((dfr3c2$Count / sum(dfr3c2$Count)) * 100)
dft <- data.frame(Grade = rep(dfr3c2$Grade, 2), 
                  Percentage = c(dfr3c2$Percentage, rep(100, 5) - dfr3c2$Percentage), 
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
ggsave(file = "HTML/Charts/home-r3c2.svg", width = 3, height = 2)
###
###------------------------------------------------ Row 3 Col 3
###
dfr3c3c <- data.frame(Performance = c("Low", "Medium", "High"),
                      Count = c(121, 219, 67))
dfr3c3g <- data.frame(Performance = c("Low", "Medium", "High"),
                      Count = c(541, 2152, 225))
dfr3c3c$Percentage <- round((dfr3c3c$Count / sum(dfr3c3c$Count)) * 100)
dfr3c3g$Percentage <- round((dfr3c3g$Count / sum(dfr3c3g$Count)) * 100)
dft <- data.frame(Performance = c(dfr3c3c$Performance, dfr3c3g$Performance), 
                  Percentage = c(dfr3c3c$Percentage, dfr3c3g$Percentage), 
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
                    labels = dfr3c3c$Performance, 
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
ggsave(file = "HTML/Charts/home-r3c3.svg", width = 3, height = 2)
###
###------------------------------------------------ Row 3 Col 4
###
dfr3c4 <- data.frame(Rate = c("Poor", "Average", "Good", "Excellent"),
                     count = c(152, 244, 121, 12))
dfr3c4$fraction <- dfr3c4$count / sum(dfr3c4$count)
dfr3c4$ymax <- cumsum(dfr3c4$fraction)
dfr3c4$ymin <- c(0, head(dfr3c4$ymax, n = -1))
dfr3c4$labelposition <- (dfr3c4$ymax + dfr3c4$ymin) / 2
dfr3c4$label <- dfr3c4$count
p <- ggplot(dfr3c4, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = as.character(1:4))) +
  geom_rect() +
  geom_label(x = 3.5, aes(y = labelposition, label = paste(round(fraction, 2) * 100, "%", sep = "")), 
             size = 3, family = "Open Sans") +
  coord_polar(theta = "y") +
  scale_fill_manual(name = "Rate",
                    labels = dfr3c4$Rate, 
                    values = c("#DFEEF5", "#a5ecd7", "#51adcf", "#0278ae")) +
  guides(fill = guide_legend(reverse=TRUE, override.aes = list(color = NULL))) +
  theme_void() +
  theme(legend.position = "right",
        text = element_text(family = "Open Sans"),
        legend.title = element_text(size = 9), 
        legend.text = element_text(size = 9))
ggsave(file = "HTML/Charts/home-r3c4.svg", width = 3, height = 2)