library(tidyverse)
library(readxl)

iris

head(iris)

as_tibble(iris)

mpg

data.frame(starwars)
starwars

weight_height <- read_csv("https://git.io/JztOr")
weight_height_df <- read.csv("https://git.io/JztOr")


weight_height_local <- read_csv("data/weight-height.csv")

weight_height_local_delim <- read_delim("data/weight-height.csv", delim = ",")

weight_height_xlsx <- read_excel("data/weight-height.xlsx")

excel_sheets("data/weight-height.xlsx")

weight_height_xlsx <- read_excel("data/weight-height.xlsx", sheet = 'weight-height')

mpg

str(mpg)
glimpse(mpg)
mpg

# filter
filter(mpg, year == 2008)

filter(mpg, displ > 5,
       year == 2008,
       cty > 15)

sort(sqrt(abs(sin(1:10))))

1:10 %>% sin() %>% abs() %>% sqrt() %>% sort()

1:10 %>% 
  sin() %>%
  abs() %>%
  sqrt() %>%
  sort()

mpg %>% 
  filter(
    displ > 5,
    year == 2008,
    cty > 15
  )

mpg %>% 
  filter(manufacturer == 'ford' | manufacturer == 'toyota' | manufacturer == 'volkswagen')

mpg_ftv_20 <- mpg %>% 
  filter(manufacturer %in% c('ford', 'toyota', 'volkswagen'),
         hwy > 20)

mpg_ftv_20

# slice
mpg %>% 
  slice(1:5)

mpg_ftv_20 %>% 
  slice(1:10)

mpg %>% 
  slice_max(cty, n = 4)

mpg %>% 
  slice_min(cty, n = 5)

mpg %>% 
  filter(manufacturer %in% c('ford', 'toyota', 'volkswagen'),
         hwy > 20) %>% 
  slice_sample(n = 5, replace = TRUE)

set.seed(2021)
mpg %>% 
  slice_sample(n = 5, replace = TRUE)

# arrange
mpg %>% 
  arrange(cty, model)

mpg %>% 
  arrange(desc(cty), desc(hwy))

# select
mpg %>% # CTRL + SHIFT + M
  select(manufacturer, model, hwy) %>% 
  filter(manufacturer %in% c('ford', 'toyota', 'volkswagen'))

mpg %>% 
  select(1, 2, 9)

mpg %>% 
  select(seq(0, 11, by = 2))

mpg %>% 
  select(1, 8:11)

mpg %>% 
  select(manufacturer, cty:class)

mpg %>% 
  select(-class)

mpg %>% 
  select(!c(class, trans))

mpg %>% 
  select(class, everything())

mpg %>% 
  select(starts_with("m"))

mpg %>% 
  select(ends_with("l"))

mpg %>% 
  select(contains("y"))

mpg %>% 
  select(where(is.numeric))

mpg %>% 
  select(where(is.character))

mpg %>% 
  select(where(is.numeric), everything())

# relocate
mpg %>% 
  relocate(cyl)

mpg %>% 
  relocate(year, .after = model)

mpg %>% 
  relocate(trans, .before = year)

mpg %>% 
  relocate(where(is.integer), .before = where(is.character))

# rename()
mpg_rename <- mpg %>% 
  rename(`company name` = manufacturer,
         `model type` = class) # new_name = old_name

mpg
mpg_rename

mpg %>% 
  rename_with(toupper)

mpg %>% 
  rename_with(toupper, ends_with("s"))

mpg_rename %>% 
  rename_with(~ gsub(" ", "_", .x))

mpg_rename %>% 
  set_names(names(.) %>% str_replace(" ", "_") %>% str_to_title())


# mutate

mpg %>% 
  mutate(mean_mpg = (cty + hwy)/2,
         cyl_mean_mpg = mean_mpg / cyl) 
  # new_name = formula

mpg %>% 
  mutate(record = row_number(),
         .before = manufacturer)

# transmute
mpg %>% 
  transmute(model,
            mean_mpg = (cty + hwy)/2)

# group_by + summarise()
mpg %>% 
  group_by(manufacturer, year) %>% 
  summarise(mean_cty = mean(cty),
            median_cty = median(cty),
            sd_cty = sd(cty)) %>% 
  arrange(-mean_cty)


# across()
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(
    mean_cty = mean(cty),
    mean_hwy = mean(hwy),
    mean_displ = mean(displ)
  )

mpg %>% 
  select(-year) %>% 
  group_by(manufacturer) %>% 
  summarise(
    across(where(is.numeric), mean, .names = "mean_{.col}")
  )

mpg %>% 
  select(-year) %>% 
  group_by(manufacturer) %>% 
  summarise(
    across(where(is.numeric),
           list(avg = mean,
                stdev = sd,
                md = median),
           .names = "{.fn}_{.col}")
  )

# count

mpg %>% 
  count(manufacturer, sort = TRUE)

# case_when()

summary(mpg$hwy)

mpg %>% 
  mutate(
    hwy_bin = case_when(
      hwy > 27 ~ "Економічні",
      hwy > 18 ~ "Звичайні",
      hwy <= 18 ~ "Високе споживання",
      TRUE ~ 'NA'
    )
  ) %>% 
  count(hwy_bin)


# pivot
GDP <- read_excel("data/API_NY.GDP.MKTP.CD_DS2_en_excel_v2_4701247.xls",
                  skip = 3)

GDP_rename <- GDP %>% 
  select(-c(`Indicator Name`, `Indicator Code`)) %>% 
  set_names(names(.) %>% str_to_lower() %>% str_replace(" ", "_"))


GDP_longer <- GDP_rename %>% 
  pivot_longer(cols = -c(country_code, country_name),
               names_to = "year",
               values_to = "GDP")
  
GDP_longer %>% 
  group_by(year) %>% 
  summarise(mean_gdp = mean(GDP, na.rm = TRUE)) %>% 
  plot()

