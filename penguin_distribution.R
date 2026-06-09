library(ggplot2)
library(dplyr)
library(palmerpenguins)

data("penguins")

# Clean data
penguins_clean <- penguins %>%
  filter(!is.na(body_mass_g),
         !is.na(species),
         !is.na(sex))

# Sex Colors
sex_colors <- c(
  "female" = "#DA70D6",  
  "male"   = "#4682B4"   
)

# Plot
p1 <- ggplot(penguins_clean, aes(x = sex, y = body_mass_g, fill = sex)) +
  geom_violin(trim = FALSE, alpha = 0.6) +
  geom_boxplot(width = 0.15, alpha = 0.4, outlier.shape = NA) +
  facet_wrap(~species) +
  scale_fill_manual(values = sex_colors) +
  labs(
    title = "Categorical Distributions & Morphized Anatomy",
    subtitle = "Physiological Variations Across Antarctic Penguin Species",
    x = "Sex",
    y = "Body Mass (g)",
    
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

# Show plot in RStudio
print(p1)

# Save high-resolution image
ggsave("penguin_distribution_sex.png", p1, width = 10, height = 6, dpi = 300)

# Summary:
# Overall, Gentoo penguins show the highest body mass. 
# Adelie and Chinstrap look almost the same, but Chinstrap seems a little heavier.