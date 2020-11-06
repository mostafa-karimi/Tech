rm(list = ls())
###------------------------------------------------ Source
source("Home-htmlgraph.R")
source("Home-htmltable.R")
###
###------------------------------------------------ Data 
###
###------------------------------------------------ Tables
###
SummaryofSources <- data.frame(Property = c("No. of Companies", "No. of Guards", "No. of Properties", 
                                            "Security Events", "Security Incidents", "Security Defects"),
                               count = c(323, 2178, 442, 118, 46, 23))
SummaryofGuards <- data.frame(Property = c("Applied", "Trained", "Recruited", 
                                           "Appreciated", "Reprimanded", "Discharged"),
                              count = c(758, 721, 633, 5, 12, 7))
###
###------------------------------------------------ Charts
###
CompaniesGradeMonthlyAverage <- data.frame(Month = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                                                     "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
                                           Grade = c(5.6, 6.3, 7.7, 7.1, 7.5, 4.3, 
                                                     3.9, 5.5, 5.1, 7.6, 6.2, 7.4))
GuardsGradeMonthlyAverage <- data.frame(Month = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                                                  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
                                        Grade = c(4.2, 6.3, 5.5, 7.1, 7.5, 6.7, 
                                                  5.8, 6.3, 5.1, 4.6, 7.7, 6.0))
SecurityEvents <- data.frame(Threat = c("Theft", "Vandalism", "Sabotage", "Assault"),
                             count = c(15, 8, 12, 2))
SecurityIncidents <- data.frame(Property = c("Residential", "Commercial", "Industrial", "Land"),
                                count = c(87, 65, 23, 8))
CompaniesGradeFrequency <- data.frame(Grade = c("1-2", "3-4", "5-6", "7-8", "9-10"),
                                             Count = c(8, 21, 85, 41, 5))
GuardsGradeFrequency <- data.frame(Grade = c("1-2", "3-4", "5-6", "7-8", "9-10"),
                                   Count = c(121, 518, 585, 241, 35))
CompaniesPerformance <- data.frame(Performance = c("Low", "Medium", "High"),
                                   Count = c(121, 219, 67))
GuardsPerformance <- data.frame(Performance = c("Low", "Medium", "High"),
                                Count = c(541, 2152, 225))
ServiceSatisfaction <- data.frame(Rate = c("Poor", "Average", "Good", "Excellent"),
                                  count = c(152, 244, 121, 12))
###
###------------------------------------------------ Output 
###
###------------------------------------------------ Tables
###
SummarySources(SummaryofSources)
SummaryGuards(SummaryofGuards)
###
###------------------------------------------------ Charts
###
CompaniesGradeAverage_chart(CompaniesGradeMonthlyAverage)
GuardsGradeAverage_chart(GuardsGradeMonthlyAverage)
SecurityEvents_chart(SecurityEvents)
SecurityIncidents_chart(SecurityIncidents)
CompaniesGradeFrequency_chart(CompaniesGradeFrequency)
GuardsGradeFrequency_chart(GuardsGradeFrequency)
PerformanceFrequency_chart(CompaniesPerformance, GuardsPerformance)
ServiceSatisfaction_chart(ServiceSatisfaction)