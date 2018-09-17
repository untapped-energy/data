# Canadian Census Data for 2016 #

> Website location of data: [https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/prof/details/download-telecharger/comp/page_dl-tc.cfm?Lang=E](https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/prof/details/download-telecharger/comp/page_dl-tc.cfm?Lang=E)

## Looker Access ##
The organizing committee has modeled the 2016 census data with Looker, a data platform that allows users to easily explore large datasets. You can access Looker using the following credentials:
```
Link: https://universityofcalgary.looker.com/
User: untapped.energy.participant@gmail.com
Password: Unt@pped2018
```

## Data Profile ##
Age, Sex, Type of Dwelling, Families, Households, Marital Status, Language, Income, Immigration and Ethnocultural Diversity, Housing, Aboriginal Peoples, Education, Labour, Journey to Work, Mobility and Migration, and Language of Work for Canada and Forward Sortation Areas, 2016 Census

For information on data quality, as well as random rounding, data suppression, and other methods of disclosure control, please consult the Guide to the Census of Population, 2016, Catalogue no. 98-304-X, and the reference guides for the individual topics.

# Where to Start? #

## Resources ##
- [List of All Census Dimensions (Doc)](https://universityofcalgary.looker.com/projects/canadian_census/documents/Dimension_Hierarchy.md) or [(Look)](/looks/2)
- [Detailed Information about Census Regions (Doc)](https://universityofcalgary.looker.com/projects/canadian_census/documents/Census_Region_Details.md)
- [Detailed Footnotes for Census (Doc)](https://universityofcalgary.looker.com/projects/canadian_census/documents/Census_Footnotes.md)
- [Description of Data Quality Flag (Doc)](https://universityofcalgary.looker.com/projects/canadian_census/documents/Data_Quality_Flag.md)

### Scripts ###
- [Python Script to Process Census Dimensions (Code)](https://universityofcalgary.looker.com/projects/canadian_census/documents/Python_Script_To_Process_Dimensions.md)

## Example Looks ##

### Custom Visualizations With Canadian Boundaries ###
TopoJSON map layers have been created so we can draw boundaries on Canadian cities and neighborhoods:
- [Map View of the Number of People Living in Edmonton FSAs](https://universityofcalgary.looker.com/looks/4)

### Patterns for Building New Derived Tables
These looks incorporate dimensions and measures from derived tables that are built from the raw census data, this makes the data set much easier to explore for an end-user:
- [Native Ukrainian Speakers in Alberta](https://universityofcalgary.looker.com/looks/5)
- [Percentage of People with Master's Degrees by Province](https://universityofcalgary.looker.com/looks/7)

### Exploring the Dimension Hierarchy ###
Some dimensions are hierarchical, for instance, the age of the population. The Dimension Hierarchy view allows you to drill through the hierarchy:
- [Number of People by Age](https://universityofcalgary.looker.com/looks/3)

### Querying Census Data by Specific Dimension IDs ###
These looks work by filtering specific dimension IDs found in the dimension hierarchy, they can be used as examples to pull just about anything from the census data:
- [Number of People in After-Tax Income Brackets, by Neighbourhood](https://universityofcalgary.looker.com/looks/1)
- [Number of People by Highest Educational Obtainment by Province](https://universityofcalgary.looker.com/looks/6)
- [Occupations - Number of People by Job Type by Province](https://universityofcalgary.looker.com/looks/8)
