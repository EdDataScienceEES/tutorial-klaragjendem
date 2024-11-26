
#Misc folder
dir.create("Misc")
file.rename(from = "style.css", to = "Misc/style.css")
file.rename(from = "nc_file_bylakeid.ipynb", to = "Misc/nc_file_bylakeid.ipynb")
file.rename(from = "LICENSE", to = "Misc/LICENSE")
file.rename(from = ".gitignore", to = "Misc/.gitignore")
file.rename(from = "tut_template.html", to = "Misc/tut_template.html")
file.rename(from = "tut_template.md", to = "Misc/tut_template.md")

dir.create("figures")
file.rename(from = "banner.jpg", to = "figures/banner.jpg")
file.rename(from = "Structured folder.png", to = "figures/Structured folder.png")
file.rename(from = "Unstructured folder.png", to = "figures/Unstructured folder.png")

dir.create("README")
file.rename(from = "README.md", to = "README/README.md")
file.rename(from = "README.html", to = "README/README.html")
file.rename(from = "README/README.html", to = "README.html")
file.rename(from = "README/README.md", to = "README.md")

dir.create("scripts")
file.rename(from = "Tutorial_script.R", to = "scripts/Tutorial_script.R")
