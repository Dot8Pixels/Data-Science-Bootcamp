library(tidyverse)
library(readxl)
library(jsonlite)
library(lubridate)
library(rvest)
library(xml2)
library(RSQLite)
library(RPostgreSQL)


get(wd)

student1 <- read_csv("data/student1.csv")

student2 <- read_delim("data/student2.txt", delim = ";")
  
student3 <- read_delim("data/student3.txt", delim = "\t")

student4 <- read_excel("data/student4.xlsx", "Sheet1")

student5 <- read_excel("data/student4.xlsx", 2)

student6 <- read_excel("data/student4.xlsx", 3, skip = 3)

ls_student <- list(
  student1,
  student2,
  student3,
  student4,
  student5,
  student6
)

all_students <- bind_rows(ls_student)

write_csv(all_students, "data/all_students.csv")

employees <- data.frame(fromJSON("data/employees.json"))

glimpse(employees)

employees$ID <- as.numeric(employees$ID)
employees$Salary <- as.numeric(employees$Salary)

employees$StartDate <- mdy(employees$StartDate)

wday(employees$StartDate, label=T)

employees$year <- year(employees$StartDate)
employees$month <- month(employees$StartDate, label=T)

html <- read_html("data/school_website.html")

html %>% html_node("title") %>% html_text()

html %>% html_node("h2") %>% html_text()

html %>% html_nodes("h2") %>% html_text()

html %>% html_nodes("li") %>% html_text()

html %>% html_nodes("ul li") %>% html_text()

html %>% html_nodes("ol li") %>% html_text()

teachers <- html %>% html_nodes("ul li") %>% html_text()
companies <- html %>% html_nodes("ol li") %>% html_text()

df <- data.frame(teachers, companies)

xml_doc <- read_xml("https://gist.githubusercontent.com/toyeiei/7495caf051daec2d45d70cb2c3daa251/raw/aaccdae3a6f2c34e9b2c326bdb9b578565c06d37/test_email.xml")

xml_doc %>% html_nodes("from") %>% html_text()

xml_doc %>% html_nodes("subject") %>% html_text()

xml_doc %>% html_nodes("content") %>% html_text()

url <- "https://www.imdb.com/chart/top/"

imdb <- read_html(url)

imdb %>% html_nodes("td.titleColumn") %>% html_text() %>% str_remove_all("\n") %>% str_trim() %>% str_replace_all("\\s+", " ") %>% head()

#HW NAME YEAR RATING

mtcars

mtcars2 <- mtcars %>% as_tibble()

mtcars2

mtcars2 <- mtcars %>%  rownames_to_column()

df <- mtcars2 %>% select(milePerGallon = mpg,
                         horsePower = hp,
                         weight = wt)

mtcars2 %>% select(model = rowname, mpg, hp, wt) %>%
  filter(mpg > 30, hp < 100)

mtcars2 %>% select(model = rowname, mpg, hp, wt) %>%
  filter(hp != 65)

mtcars2 %>% select(model = rowname, mpg, hp, wt) %>%
  filter(str_detect(model, "^M"))

mtcars2 %>% select(model = rowname, mpg, hp, wt) %>%
  filter(str_detect(model, "^[MT]"))

state.name

str_detect(state.name, "^M", negate = TRUE)

!str_detect(state.name, "^M")

state.name[str_detect(state.name, "^S")]

state.name[str_detect(state.name, "\\s")]

state.name[str_detect(state.name, "\\s", negate = T)]

mtcars2 %>% select(model = rowname, mpg, hp, wt) %>%
  filter(str_detect(model, "^[MT]")) %>%
  arrange(desc(mpg))

mtcars2 %>% select(model = rowname, mpg, hp, wt) %>%
  filter(str_detect(model, "^[MT]")) %>%
  mutate(hp_double = hp*2,
         hp_log = log(hp),
         wt_ext = exp(wt))


mtcars2 %>% select(model = rowname, mpg, hp, wt) %>%
  filter(str_detect(model, "^[MT]")) %>%
  mutate(segment = str_sub(model, 1, 1)) %>%
  arrange(segment, -mpg) %>%
  summarise(avg_mpg = mean(mpg),
            sum_mpg = sum(mpg),
            median_t = median(wt),
            n =)

result <- mtcars2 %>% select(model = rowname, mpg, hp, wt) %>%
  filter(str_detect(model, "^[MT]")) %>%
  mutate(segment = str_sub(model, 1, 1)) %>%
  group_by(segment) %>%
  summarise(avg_mpg = mean(mpg),
            sum_mpg = sum(mpg),
            median_t = median(wt),
            n =)

write_csv(result, "data/result.csv")

set.seed(1)
mtcars2 %>% sample_n(5)
mtcars2 %>% sample_frac(0.25)

mtcars2 %>% mutate(am = ifelse(am == 0, "Auto", "Manual"))

ifelse((x<-85) >= 80, "Passed", "Failed")

mtcars2 %>% select(-rowname, -hp) %>% 
  mutate(am = as.factor(ifelse(am == 0, "Auto", "Manual"))) %>% 
  group_by(am) %>%
  summarise_all(mean)

conn <- dbConnect(SQLite(), "data/chinook.db")

dbListTables(conn, "customers")

customers <- dbGetQuery(conn, "SELECT * FROM customers LIMIT 5")

customers %>% as_tibble() %>% select(2, 3, Country)

artist_album <- dbGetQuery(conn, 
                           "SELECT artists.name, albums.title 
                           FROM artists JOIN albums 
                           ON artists.artistid = albums.artistid")


conn2 <- dbConnect(PostgreSQL(),
                   user = "xgvolwcn",
                   password = "Fbob5tyatBES3e3BO2oC4CnhOfNSPIsV",
                   host = "arjuna.db.elephantsql.com",
                   port = 5432,
                   dbname = "xgvolwcn")

dbListTables(conn2)

dbWriteTable(conn2, "data", mtcars)

dbListFields(conn2, )


worldphone <- read_csv("https://gist.githubusercontent.com/toyeiei/d9e267754d0b7a7045e182b3d0011636/raw/04cf2d5b211dc3df279b36d968fde11ed1c9bb67/worldphone.csv")

long_wp <- worldphone %>% pivot_longer(N.Amer:Mid.Amer, names_to = "Region", 
                            values_to = "Sales")

worldphone %>% pivot_longer(-Year, names_to = "Region", 
                            values_to = "Sales")

wide_wp <- long_wp %>% pivot_wider(names_from = Region, values_from = Sales)

write_csv(worldphone, "data/worldphone.csv")

stud <- read_excel("data/scholarships.xlsx", 1)
address <- read_excel("data/scholarships.xlsx", 2)
scholarship <- read_excel("data/scholarships.xlsx", 3)

inner_join(stud, address)

stud %>% left_join(address, by = "id") %>% 
  inner_join(scholarship, by = "id")

stud <- stud %>%
  rename(student_id = id)

tmp <- stud %>% left_join(address, by = c("student_id" = "id")) %>%
  inner_join(scholarship, by = c("student_id" = "id"))

tmp %>% inner_join(scholarship, by = c("student_id" = "id"))
