---
output:
  html_document: default
  word_document: default
  pdf_document: default
css: Misc/style.css
---

<div class="banner">
  <h1>REPRODUCIBLE RESEARCH:</h1>
  <h2>Organizing Your R Project: Best Practices for Reproducible Ecology Research</h2>
</div>

_Created by Klara Gjendem - November 2024_

--------

# Tutorial Aims:

1. Understand the importance of organizing your R project for reproducibility.
2. Manage dependencies and package versions with the `renv` package.
3. Set up project-specific settings in RStudio to streamline workflows.
4. Create a clear and accessible README file to provide context and instructions.
5. Automate data cleaning and analysis pipelines for efficiency and consistency.

# Steps to Achieve Tutorial Aims:

### <a href="#section1"> 1. Introduction</a>
##### <a href="#subsection1"> 1.1 Prerequisites</a>
##### <a href="#subsection2"> 1.2 Setting up your project</a>
### <a href="#section2"> 2. Set up a consistent folder structure for reproducibility</a>
##### <a href="#subsection3"> 2.1 Understand the importance of a clear folder organization</a>
##### <a href="#subsection4"> 2.2 Learn how to create directories for data, scripts, outputs, and documentation</a>
### <a href="#section3"> 3. Manage dependencies and package versions with `renv`</a>
##### <a href="#subsection5"> 3.1 Set up and activate a reproducible project environment</a>
### <a href="#section4"> 4. Automate your data cleaning and analysis pipeline</a>
##### <a href="#subsection6"> 4.1 Use R scripts to automate repetitive tasks</a>
##### <a href="#subsection7"> 4.2 Document your workflow to ensure others can follow your process</a>
### <a href="#section5"> 5. Create a clear and accessible README file</a>
### <a href="#section6"> 6. Challenge Yourself! file</a>

## 1. Introduction
<a name="section1"></a>

It's only a matter of time before, while working on or reading a Research Report in RStudio, you encounter issues with structure and organization. Not being able to find a specific file, not knowing how to properly organize and structure your work, not being sure what to include in your README file to make it easier for the reader to understand... **But don't you worry any more!** We have created this tutorial on organizing your R project for reproducibility so that you can come back to it whenever you have to carry out a report, and never have to stress about these issues again.

What do we mean by reproducibility exactly? We mean structuring your project in a way that ensures others (and your future self) can understand, reproduce, and build upon your analysis without ambiguity or difficulty. It’s about creating a clear, standardized, and systematic framework for storing and managing files, code, and dependencies so that the project remains easy to navigate, execute, and share.

### 1.1 Pre-requisites
<a name="subsection1"></a>

While this tutorial is of basic to intermediate difficulty, we recommend learners first checking the [Getting started with R and RStudio](https://ourcodingclub.github.io/tutorials/intro-to-r/) and [Intro to GitHub for version control](https://ourcodingclub.github.io/tutorials/git/), which will give you basic knowledge on:

- **How R and RStudio work**

- **What version control is and how to use `git`and GitHub**.


<div style="border: 2px solid #FFD4F6; padding: 15px; border-radius: 5px; background-color: alert%; margin: 15px 0;">
All the files you need to complete this tutorial can be downloaded from <a href="https://github.com/klaragjendem/CC-Reprod-Report.git" target="_blank">this Github repository</a>. Clone and download the repo as a zip file, then unzip it.
</div>

### 1.2 Setting up your project
<a name="subsection2"></a>

The very first step we recommend, is to set up your project with version control on `git`or GitHub. As you well know if you have looked into the tutorial we provided earlier, version control is a system that allows you to track changes in your project files over time. Git and GitHub are essential tools for reproducible research and collaboration, enabling you to:

- Revert to previous versions if a mistake is made.
- Track the history of changes, including when and why modifications are made.
- Collaborate seamlessly with others, even remotely, by merging different contributions.

These tools will make your life easier when carrying out your research report. 

## 2. Set up a consistent folder structure for reproducibility
<a name="section2"></a>

### 2.1 Understand the importance of a clear folder organization
<a name="subsection3"></a>

Imagine you are giving peer feedback to a classmate, or you are carrying out your own research project, and the first thing you see when you open the Repository is the following:

<figure style="text-align: center;">
    <img src="Unstructured folder.png" alt="Unorganized folder structure" width=70% style="display: block; margin: 0 auto;">
    <figcaption>Unorganized folder structure</figcaption>
</figure>

<br>

It might take you some time to find where the README markdown file is, but it might take you even longer to find the specific script you are supposed to read. Having to spend extra time and energy looking for a file becomes a waste of time, negatively impacting the report. **We do not want this!**

Now look at the following repository:

<figure style="text-align: center;">
    <img src="Structured folder.png" alt="Nice and organized folder structure" width=70% style="display: block; margin: 0 auto;">
    <figcaption>Nice and organized folder structure</figcaption>
</figure>

<br>

Much better! It is obvious what folder we need to use depending on what we are looking for, and it's very straightforward what each relevant folder contains.

For this reason, it is considered of great importance to have a clear and consistent folder structure for organizing research projects. Good folder organization makes it easier to locate files, understand workflows, and ensure that others can easily navigate and reproduce the analysis. Additionally, it allows collaborators (and your future self) to find essential files quickly and reduces the risk of data, scripts, or results being lost or overwritten. For larger or collaborative projects, a standard structure helps everyone understand where files are and what each folder contains, making teamwork smoother.

### 1.2 Learn how to create directories for data, scripts, outputs, and documentation
<a name="subsection2"></a>

#### Suggested Folder Structure:

Once you choose a specific structure depending on project needs, it should remain consistent throughout the whole project. A suggested and easy to follow folder structure is as follows:

- `data/` – for raw and processed datasets. Subfolders could include `data/raw` for unmodified raw data and `data/processed` for any cleaned or transformed data.

- `scripts/` – for all R scripts and code used in data cleaning, analysis, and visualization.

- `output/` – for storing any output generated by scripts, like plots, tables, or model summaries.

- `docs/` – for documentation, including research notes, and any reference documents.

- `figures/` – for all images used in reports or presentations.

- `README/`- for the README file.


#### Setting Up the Folders in RStudio

Use `dir.create("folder_name")` in R to create folders, or create them directly in the RStudio Files pane by right-clicking and selecting New Folder.

Following the suggested folder structure we presented earlier, this is the code needed to create them:

```r
# Creating a folder structure in R
dir.create("data")
dir.create("data/raw")
dir.create("data/processed")
dir.create("scripts")
dir.create("output")
dir.create("docs")
dir.create("figures")
dir.create("README")
```

This approach ensures the folders are created in the correct project directory.
Run this code on your script to try it out.

#### Moving files to new folders

In order to move a file to a specific folder, we can use the `file.rename()` function. Here's how:

```r
file.rename(from = "path/to/file", to = "path/to/destination/file")
```

As an example, if we wanted to move the file `green_turtle.jpg` from our directory to the folder called `figures`, we would do:

```r
# Move green_turtle.jpg to the figures folder
file.rename(from = "green_turtle.jpg", to = "pictures/green_turtle.jpg")
```

#### Tips for Keeping the Folder Structure Organized

- **Naming Conventions**: Use clear, descriptive names for files and folders, avoiding spaces and special characters. For example, instead of "*Analysis v2_final.R*", use "*data_cleaning_script.R*".

- **Versioning Raw Data Carefully**: Always keep the raw data unmodified in the `data/raw` folder. Any cleaning or transformation should create a new file in `data/processed`.

- **Regularly Review and Clean**: Over time, projects can accumulate unused files. To avoid any problems, it is encouraged to periodically review and remove or archive unnecessary files.

## 3. Manage dependencies and package versions with `renv`
<a name="section3"></a>

#### Why Dependency Management is Important

R packages are continually evolving, with new features being introduced and older ones potentially being deprecated. When your project depends on specific package versions, updates can sometimes cause compatibility issues or unexpected errors. The `renv` package (R environment) addresses this challenge by enabling you to lock down the exact package versions used in a project. This ensures reproducibility, making it easier to share your work with collaborators or revisit your project in the future without concerns about compatibility.

### 3.1 Set up and activate a reproducible project environment
<a name="subsection5"></a>

#### Setting Up `renv` in Your Project

- **Initialize `renv`**:

1. Open your R project in RStudio.

2. Install `renv` by running:

```r
install.packages("renv")
```

3. Run `renv::init()` in the R console to create a local environment for the project. This will initialize a project-specific library.

```r
renv::init()
```

4. `renv` will automatically detect the packages used in your project and create a snapshot of their versions in a file called `renv.lock`.

- **Explanation of Key Files**:

  - `renv.lock`: A file that lists the exact package versions used in your project. This file can be shared with collaborators to ensure they use the same package versions.

  - `renv/library`: A local folder within the project where renv stores the specific versions of the packages.

#### Adding and Removing Packages

- **Install Packages**: Use `install.packages("package_name")` to install new packages. `renv` will track the package versions in `renv.lock`.

- **Remove Packages**: Use `remove.packages("package_name")` to uninstall a package you no longer need, and `renv` will update the lock file accordingly.

- **Snapshot Your Project’s State**: Use `renv::snapshot()` to update` renv.lock` with the current versions of all packages used. This ensures that if you’ve added or updated packages, the lock file reflects those changes.

#### Restoring the Project Environment

**Restore Dependencies**: When you or a collaborator opens the project, they can run `renv::restore()` to install the exact versions of packages listed in `renv.lock`. This is especially useful if someone is using a different system or if package updates have been released since the project was first created.

#### Tips for Using `renv` Effectively

- **Commit the `renv.lock` file**: Since the `renv.lock` file stores all package versions, commit it to version control so that collaborators can access the locked package versions.

- **Don’t Commit the `renv/library` Folder**: This folder can be large and is unique to each system, so add it to .gitignore to avoid sharing it.

- **Regularly Snapshot**: Make it a habit to run `renv::snapshot()` after installing or updating packages to keep the lock file up to date.


## 4. Create a clear and accessible README file 
<a name="section5"></a>

A README file serves as a crucial introduction to your project, offering essential context and acting as the go-to resource for understanding its purpose, usage, and structure. It provides clear information on what the project does, how to use it, and where to locate key resources. A well-crafted README enhances both the accessibility and reproducibility of your work by offering straightforward instructions for setting up the project, running the code, and managing dependencies.

#### Key Sections to Include in a README

- **Project Title and Description**:

Start with a clear, descriptive title for your project. Include a brief overview of the project’s purpose, objectives, and its relevance. For example:

```markdown
# Green Turtle Population Analysis
This project analyzes long-term population trends of the green turtle species to assess abundance changes over time.
```

- **Setup and Installation Instructions**:

Provide clear steps for setting up the project, including any necessary installations or dependencies. If you’re using `renv`, include instructions for restoring the environment:

```markdown
## Installation
1. Clone this repository to your local machine.
2. Open the R project file (`project_name.Rproj`) in RStudio.
3. Run `renv::restore()` to install the required packages.
```

- **Usage Instructions**:

Describe how to use the code, including any main scripts, functions, or analyses. Specify which scripts to run and in what order, if applicable. This can be a bulleted list or steps, such as:

```markdown
## Usage
- `data_cleaning.R`: Prepares the raw data for analysis.
- `analysis_script.R`: Runs the main statistical analysis.
- `visualization_script.R`: Generates figures and summary plots.
```

- **Data Sources**:

Describe where the data comes from and any important details about it, such as license information or permissions if it’s publicly available. For example:

```markdown
## Data
This project uses data from the Living Planet Index, which is available to the public.
````

- **Results and Findings**:
Summarize any main results or findings from the analysis. This can be a brief paragraph describing outcomes or linking to reports or visualizations created by the project. For example:

```markdown
## Results
The analysis suggests that green turtle abundance has fluctuated over time, with a notable decline in recent years.
```

- **Contact Information**:
Include a way for people to reach you if they have questions about the project. This could be your email or GitHub profile link.

```markdown
## Contact
For any questions, please contact [Your Name](mailto:your.email@example.com).
````

#### Tips for Writing an Effective README

- **Keep It Concise**: Avoid unnecessary detail; keep descriptions short and to the point.

- **Use Clear Language**: Write in simple language and technical terms, especially if the project is intended for a broader audience.

- **Format with Headings and Lists**: Use headings, subheadings, and lists to improve readability.

- **Update Regularly**: Update the README file if there are any significant changes in the project, such as new analyses or modified dependencies.

#### Example README Structure

Here's the example layout structure we mentioned earlier, which you can use as a starting point in your project: 

```markdown
# Project Title

## Description
Brief project overview.

## Installation
1. Clone the repo.
2. Open `project_name.Rproj` in RStudio.
3. Run `renv::restore()` to install required packages.

## Usage
- `script1.R`: Description of script 1.
- `script2.R`: Description of script 2.

## Data
Information about data sources.

## Results
Brief summary of findings.

## Contact
For questions, reach out to [Your Name](mailto:your.email@example.com).
````

## 5. Automate your data cleaning and analysis pipeline
<a name="section6"></a>

Automating data cleaning and analysis tasks streamlines your workflow, saving time and minimizing errors by ensuring each step is applied consistently. It enhances reproducibility by allowing others to follow a single script rather than manually performing individual steps. With a fully automated pipeline, you can execute the entire process with a single command, making it simple to verify results or rerun analyses when new data becomes available.

#### Structuring Your Pipeline

- **Separate Scripts for Different Tasks**:
It’s helpful to organize your pipeline by creating separate scripts for distinct stages, such as data cleaning, analysis, and visualization. This modular approach makes it easier to troubleshoot specific stages and understand the workflow.

- **Suggested script organization**:
  - `data_cleaning.R` – Loads raw data, cleans, and preprocesses it for analysis.
  - `analysis.R` – Performs the main statistical analysis.
  - `visualization.R` – Generates visualizations based on analysis results.

- **Using `source()` to Chain Scripts Together**:
Use `source("script_name.R")` to run one script from another. For example, if `analysis.R` requires clean data, you can start `analysis.R` with `source("data_cleaning.R")` to ensure it’s always using the latest cleaned data.

Example:

```markdown
# In analysis.R
source("data_cleaning.R")
# Continue with analysis
```

### 6.1 Use R scripts to automate repetitive tasks
<a name="subsection8"></a>

#### Automating with `Make` or Custom R Scripts

- **Using a `Makefile` (Optional)**:
If you’re comfortable with command-line tools, a `Makefile` can automate complex workflows by specifying dependencies and execution order. A `Makefile` can be especially useful in larger projects with multiple datasets or analysis steps.

Example `Makefile` snippet:

```makefile
all: analysis

analysis: data_cleaning.R analysis.R
    Rscript data_cleaning.R
    Rscript analysis.R
````

- **Automating with a Master Script in R**:

For simpler workflows, a master R script can sequentially call each part of the pipeline. This script serves as a single entry point for the entire analysis, making it easy to rerun the analysis from start to finish.

Example `main.R`:

```r
# Master script for entire workflow
source("data_cleaning.R")
source("analysis.R")
source("visualization.R")
````

#### Using Functions for Repetitive Tasks

Create Custom Functions: Identify repetitive tasks (like data transformation or summary statistics) and create functions for them. This makes your code more modular and easier to understand.

Example:

```r
# Define a function for common data cleaning steps
clean_data <- function(data) {
  data %>%
    filter(!is.na(variable)) %>%
    mutate(variable = as.factor(variable))
}
````

#### Tips for Maintaining an Automated Pipeline

- **Test Each Step Individually**: Run each script separately to confirm it works before integrating it into the main pipeline.

- **Use Clear Naming Conventions**: Name your scripts descriptively (`data_cleaning.R`, `analysis.R`, etc.) to make the process easy to follow.

- **Document Each Script**: Include comments or a brief description at the start of each script to explain its role in the pipeline.

### 6.2 Document your workflow to ensure others can follow your process
<a name="subsection9"></a>

Be very consistent in your commits, or comments within the code, stating what you are doing and why so that others can easily follow your process. Imagine you are the one having to continue the work someone else started, opening many different files with no comments on them whatsoever, it would take you ages to catch up on what the person in front of you did. This is a lot of time and energy going to waste, and none of us has that! So keep this in mind throughout your entire work.


<hr>

#### Check out our <a href="https://ourcodingclub.github.io/links/" target="_blank">Useful links</a> page where you can find loads of guides and cheatsheets.

#### If you have any questions about completing this tutorial, please contact us on ourcodingclub@gmail.com

#### <a href="INSERT_SURVEY_LINK" target="_blank">We would love to hear your feedback on the tutorial, whether you did it in the classroom or online!</a>

<ul class="social-icons">
	<li>
		<h3>
			<a href="https://twitter.com/our_codingclub" target="_blank">&nbsp;Follow our coding adventures on Twitter! <i class="fa fa-twitter"></i></a>
		</h3>
	</li>
</ul>

### &nbsp;&nbsp;Subscribe to our mailing list:
<div class="container">
	<div class="block">
        <!-- subscribe form start -->
		<div class="form-group">
			<form action="https://getsimpleform.com/messages?form_api_token=de1ba2f2f947822946fb6e835437ec78" method="post">
			<div class="form-group">
				<input type='text' class="form-control" name='Email' placeholder="Email" required/>
			</div>
			<div>
                        	<button class="btn btn-default" type='submit'>Subscribe</button>
                    	</div>
                	</form>
		</div>
	</div>
</div>
