## National Pollutant Release Inventory (NPRI)

The National Pollutant Release Inventory (NPRI) is Canada's public inventory of pollutant releases (to air, water and land), disposals and transfers for recycling. These files contain data from 1994 to the latest reporting year available.

### Links
- [National Pollutant Release Inventory](https://www.canada.ca/en/services/environment/pollution-waste-management/national-pollutant-release-inventory.html)
- [NPRI Bulk Data](https://open.canada.ca/data/en/dataset/40e01423-7728-429c-ac9d-2954385ccdfb)

The files saved in this repository have been filtered to only show data from the province of Alberta.

### Files 

Overview of the contents of the downloadable NPRI Bulk Data files. 
	
- *NPRI-SubsRele-Normalized-Since1994* - contains all substance release quantities. For each release, the following data is provided: Reporting Period (calendar year), NPRI ID, Facility Name, Company Name, North American Industry Classification System (NAICS) code, Province Name, Chemicals Abstract Service (CAS) Registry Number, Substance Name, Group (identifies if release was to air, land, water, or reported as 'sum of all media' when the release amount is less than 1 tonne), Category (identifies the type of release, i.e. stack/point, fugitive, leaks, other, etc.), Quantity, Units, and Estimation Method*. 
- *NPRI-SubsDisp-Normalized-Since1994* - contains all on-site and off-site disposal quantities, including Tailings and Waste Rock (TWR). For each disposal, the following data is provided: Reporting Period (calendar year), NPRI ID, Facility Name, Company Name, North American Industry Classification System (NAICS) code, Province Name, Chemicals Abstract Service (CAS) Registry Number, Substance Name, Group (identifies if disposal was on-site, on-site TWR, off-site, or off-site TWR), Category (identifies the method of disposal, i.e. landfill, underground injection, etc.), Quantity, Units, and Estimation Method*. 
- *NPRI-SubsDisp-Tran-Recy-Normalized-Since1994* - contains all quantities transferred for recycling or treatment prior to disposal. For each transfer, the following data is provided: Reporting Period (calendar year), NPRI ID, Facility Name, Company Name, North American Industry Classification System (NAICS) code, Province Name, Chemicals Abstract Service (CAS) Registry Number, Substance Name, Group (off-site recycling or off-site treatment), category (identifies the method of treatment or recovery, i.e. chemical treatment, biological treatment, solvent recovery, etc.), Quantity, Units, and Estimation Method*. 
- *NPRI-Substance-Comments-Normalized-Since1994* - contains all the reporter-provided comments about substances included in their report. For each comment, the following data is provided: Reporting Period (calendar year), NPRI ID, Facility Name, Company Name, North American Industry Classification System (NAICS) code, Province Name, Chemicals Abstract Service (CAS) Registry Number, Substance Name, Comment Type Code (Short form of Comment Type Name), Comment Type Name (ex. Reason Why Facility Is Adding This Substance, Disposal Comments, etc.), and Comment.
- *NPRI-Facility-Geo-Locations-Since1994* - contains complete location information for all facilities that have reported data to the NPRI. For each NPRI reporting facility since the inception of the program, the following data is provided: year of last filed report, NPRI ID, company and facility name, address, city, province, postal code, physical land survey description, physical national topographical description, latitude, longitude, datum, key industrial sector, etc. Other geographical data is provided in this file.

### Estimation method codes: 
* M1 - Continuous Emission Monitoring
* M2 - Predictive Emission Monitoring
* M3 - Source Testing
* C - Mass Balance
* E1 - Site Specific Emission Factors
* E2 - Published Emission Factors
* O - Engineering Estimates
* NI - No Information Available
* NA - Not Applicable
