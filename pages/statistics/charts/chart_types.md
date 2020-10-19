# Chart Types

## Qualitative Univariate Analysis

This focus on categories or non-numeric variables, and in this case we are interested on only one variable, and we are interested on, for instance:  

### What does it measure?

* Frequency
* Average
    
### It Can Answer Questions Like

    1. How many movies in each rating category?  
    2. What proporcion of movies have won awards?

### Charts & Plots

* [Frequency Bar Chart](frequency_bar_chart.md)
* [Cleveland Plot](cleveland_dot_chart.md)
* [Pie Chart](pie_chart.md)

## Quantitative Univariate Analysis

### What does it measure?

* Location of the data
* Spread of the data
* Shape of the data

### It Can Answer Questions Like

  1. What is the average movie runtime?
  2. Are there any outliers?
  3. How spread out are the movie runtimes?
  4. What is the shape of the runtime distribution?

### Charts & Plots

* [Dot Plot](dot_plot.md)
* [Jitter Plot](jitter_plot.md)
* [Box Plot](box_plot.md)
* [Histograms](histograms.md)
* [Density Plot](density_plot.md)

## Qualitative Bivariate Analysis

### What does it measure?

  * Interested on the joint frequency of observations
  * Useful for the intersection of two categories
  * We can use a contingency table, for instance, the intersection between cols and rows
  * Use of marginal frequencies
  * Use relative frequency

    
**Marginal Frequency**: That is the total columns or rows, it may be count, sum, etc.  

**Relative frequency**: That is the percentage ( values between 0 and 1)  

**Contingency table**: AKA: 

  * Two-dimensional frequency table
  * Two-way table
  * Cross tabulation matrix

### It Can Answer Questions Like

  1. How many award-winning movies are in each rating category?
  2. What proportion of movies in each category have won awards?

### Charts & Plots

  * [Grouped Frequency Bar Chart](grouped_frequency_bar_chart.md)
  * [Stacked Frequency Bar Chart](stacked_frequency_bar_chart.md)
  * [100% Stacked Frequency Bar Chart](100_staked_frequency_bar_chart.md)
  * [Spine Plot](spined_plot.md)
  * [Mosaic Plot](mosaic_plot.md)

## Quantitive Bivariate Analysis

*In this topic we are covering the relationship between two numeric variables.*
  
### What Does It Measure?

  * Interested in how two numeric variables are related
  * Location, Spread and Shape of the distribution at the same time
  * Time series analysis


### It Can Answer Questions Like

  1. How are runtime and box-office revenue related?
  2. Has the average box-office revenue changed over time?

### Charts & Plots

* [Scatter Plot](scatter_plot.md)
* [Binned Frequency Heatmap](binned_frequency_heatmap.md)
* [Hexagonal Binned Frequency Heatmap](binned_hex_heatmap.md)
* [Countour Plot](contour_plot.md)
* [Level Plot](level_plot.md)
* [Mesh Plot](mesh_plot.md)
* [Surface Plot](surface_plot.md)
* [Step Chart](step_charts.md)
* [Line Chart](line_chart.md)
* [Area chart](area_chart.md)

## Qualitative and Quantitative Bivariate Analysis

> Visualizing both a categorical and a numeric variable*

For this type of analysis we group numeric variable using categorical variable, usually we use an aggregate value.

### What Does It Measure?

1) Look for a aggregate value
2) Gruop by category
3) Use the result to compare them

### It Can Answer Questions Like

 1. How does average box-office revenue compare across raings?
 2. How similar are the spreads of box-office revenue across ratings?
 3. How do their shapes compare?

### Charts & Plots

* [Bar Chart](bar_chart_bivariate.md)
* [Bivariate Box Plot](box_plot_bivariate.md)
* [Notched Box Plot](notched_box_plot.md)
* [Bivariate Violin Plot](violin_plot_bi.md)


## Multivariate Data Visualization

### Facet Technique

Process of creating multiple plots in a single chart, they may be arranged in row and or columns.  

#### Horizontal Facets

* Share y-axes
* Compressed x-axes
* Compare y-axes
    
#### Vertical Facets

* Shared x-axes
* Compressed y-axes
* Compare x-axes

#### Wrapped Facets

* Wrap to rows
* Shared axes
* Equal importance compare x-axes and y-axes
    
#### Two-dimensional Grid Facets

* Four or more variables
* Shared axes
* Variable compression
* Multiple orientation

#### Charts & Plots

* [Horizontal Facet](facet_horizontal.md)
* [Vertical Facet](facet_vertical.md)
* [Wrapped Facet](facet_wrapped.md)
* [2D Facetted Grid](facet_2d_grid.md)

## Qualitative Trivariate Analysis

### What Does It Measure?

* Three categorical variables
* Frequency of observations
* Three-way contingency table
* Flat or Partial Contingency table
* Case Wise Contingency table (this is the preferred format for Lattice & ggplot)
  - Tidy format.

### It Can Answer Questions Like

1) How many movies based on rating, awards, and distribution?

### Charts & Plots

* [Faceted Grouped Frequency Bar Chart](faceted_grouped_frequency_bar_chart.md)
* [Faceted Stacked Frequency Bar Chart](faceted_stacked_frequency_bar_chart.md)
* [Faceted Frequency Bar Chart](faceted_frequency_bar_chart.md)

## Trivariate Analysis - 2 Qualitative and 1 Quantitative

### What Does It Measure?

* 2 Categorical variables
* 1 Numeric variable
* Aggregate measure (sum, min, max, avg, etc...)
* Multiple table formats

### It Can Answer Questions Like

1) How does box office revenew compare across award status and rating?
2) Are there any patterns?

### Charts & Plots

* [Grouped Bar Chart](grouped_bar_chart_2qual_1quan.md)
* [Stacked Bar Chart](stack_bar_chart_2qual_1quan.md)
* [Faceted Bar Chart](faceted_bar_chart_2quan_1quan.md)
* [Heat Map](heat_map_2quan_1qual.md)

## Trivariate Analysis - 1 Qualitative and 2 Quantitative

### What Does It Measure?
  
* 1 Categorical variables
* 2 Numeric variable
* Relationship by categories
* Time series

### It Can Answer Questions Like

* How does critic score relate to box office in each rating category?
* How has box office reveneu changed over time and rating category?

### Charts & Plots

* [Color-coded Scatter Plot](color_coded_scatter_plot.md)
* [Shaped-coded Scatter Plot](shaped_coded_scatter_plot.md)
* [Faceted Scatter Plot](faceted_scatter_plot.md)
* [Multi-Series Line Chart](multiseries_line_chart.md)
* [Stacked Area Chart](stacked_area_chart.md)
* [Faceted Line Chart](faceted_line_chart.md)

## Quantitative Trivariate Analysis

### What Does It Measure?

* Three numeric variables
* Relationship among them

### It Can Answer Questions Like

* We need to convert numeric data into categorical, using ranges.
  - Named: binning, discretization, or quantization.
  
### Charts & Plots

* [Gradient Color-Scale Scatter Plot](gradient_color_scale_scatter_plot.md)
* [Divergent Color-Scale Scatter Plot](divergent_color_scale_scatter_plot.md)
* [Bubble Chart](bubble_chart.md)
* [3D Scatter Plot](3d_scatter_plot.md)

## Multivariate Analysis

### What Does It Measure?

* Visualizing Many Variables
* Relationships
* Patterns
  
### It Can Answer Questions Like

* Are there correlations?
* Are there any patterns?

### Plots & Charts

* [Correlogram](correlogram.md)
* [Scatter Plot Matrix](scatter_plot_matrix.md)
* [Parallel Coordinates Plot](parallel_coordinates_plot.md)

## Visualizing Spatial Data

### What Does It Measure?

* It uses topological, geometric or geographic properties
* Geospatial analysis - for earth places
* Two numeric variables
* Longitude
* Latitude
* Other variables can be used, not only latitude and longitude.

### It Can Answer Questions Like

* What counties are we distributing movies to?
* Where do we distribute the most movies?

### Plots & Charts

* [Dot Density Map](maps_charts.md)
* [Contour Map](maps_charts.md)
* [Level Map](maps_charts.md)
* [Bubble Map](maps_charts.md)
* [Choropleth](maps_charts.md)
* [Map Projections](maps_charts.md)

## Visualizing Hierarchical Data

### What Does It Measure?

* Parent-child relationship
* Modeled as trees
* Multiple levels
* Two-level  hierarchy
* Third numeric variable

### It Can Answer Questions Like

* What regions contain our top 10 distribution?
* What is their average box office revenue?
x
### Plots & Charts

* [Tree Diagram](hierarchical_data.md)
* [Tree Graph](hierarchical_data.md)
* [Dendrogram](hierarchical_data.md)
* [Radial Tree](hierarchical_data.md)
* [Tree Map](hierarchical_data.md)
  
### Notes
* [General Analysis Notes](general_analysis_notes.md)