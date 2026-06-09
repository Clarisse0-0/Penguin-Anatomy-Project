library(ggplot2)
library(dplyr)
library(palmerpenguins)

penguins_clean <- penguins %>%
  filter(!is.na(flipper_length_mm),
         !is.na(bill_length_mm),
         !is.na(species),
         !is.na(island))

ggplot(penguins_clean, aes(bill_length_mm, flipper_length_mm, color = species, shape = island)) +
  geom_point(size = 2, alpha = 0.6) +
  geom_smooth(aes(color = NULL, shape = NULL), 
              method = "lm", 
              se = TRUE, 
              linewidth = 0.8, 
              color = "#8B004F",   
              fill = "white", 
              alpha = 0.1) +
  
  scale_color_manual(values = c(
    "Adelie"    = "#FFB6C1",  
    "Chinstrap" = "#C71585",
    "Gentoo"    = "#9370DB"
  )) +
  
  labs(
    title = "Bill vs Flipper Length (Overall Trend)",
    subtitle = "Correlation Across Species and Islands",
    x = "Bill Length (mm)",
    y = "Flipper Length (mm)",
  ) +
  
  theme_minimal(base_size = 10) +
  theme(
    # Background
    panel.background = element_rect(fill = "#fffbfd"),
    plot.background = element_rect(fill = "#fffbfd"), 
    panel.grid.major = element_line(color = "gray90"),
    panel.grid.minor = element_blank(),
    
    # Typography
    plot.title = element_text(size = 13, face = "bold", color = "#8B004F", hjust = 0.5),
    plot.subtitle = element_text(size = 10, face = "italic", color = "#8B004F", hjust = 0.5),
    axis.title.x = element_text(size = 9, face = "bold.italic", color = "#8B004F"),
    axis.title.y = element_text(size = 9, face = "bold.italic", color = "#8B004F"),
    strip.text = element_text(face = "bold", color = "#8B004F"),
    
    # Legend
    legend.position = "bottom",
    legend.title = element_blank()
  )

# Summary:
# The chart shows that penguins with longer bills usually have longer flippers.
# Even though the species are different, the overall line shows the same upward trend.
