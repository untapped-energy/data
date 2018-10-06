# SCADA Data

This data represents a raw data dump of data from several SCADA servers. The bulk of the data is in the time-series historical data. The SCADA host has an internal structure that represents the producer's areas, fields, wells, meters and sensors. Each object in the SCADA host database is identified by a unique Id number. You can use this object Id to join the metadata with the historical data. 

There are several files being uploaded for each server. wells.csv, meters.csv, points.csv all contain metadata for the various objects in the system. Historic_data contains csv files of the point's history, each csv is named with the point's Id number.  

## Tasks

- [x] Export metadata from server_1
- [x] Upload metadata from server_1
- [ ] Export historic data from server_1 (about 30% done)
- [ ] Upload historic data from server_1
- [ ] Export metadata from server_2
- [ ] Upload metadata from server_2
- [ ] Export historic data from server_2
- [ ] Upload historic data from server_2

## Server 1 Files

This is SCADA data from a Tier 2 producer with properties all over Alberta. Focusing efforts on uploading data from Central Alberta first and will expand data collection as time permits. There are samples of data from a variety of areas.  

- wells.csv - contains a list of all the wells in the system. 
- meters.csv - contains a list of the EFM meters in the system and their configuration (includes gas composition/quality). 
- analog_points.csv - contains a list of all the analog points in the system and their metadata. 
- digital_points.csv - contains a list of all the digital/discrete points in the system and their metadata. 
- historic_data - this folder contains the point history, one file per point. History is from Sept 2017 to Sept 2018. Join with the point lists for better context. **I stopped uploading files... too many and some are too large. - Dustin**

You can download a ZIP file of the server_1 files here: https://s3-us-west-2.amazonaws.com/cdn.jpisolutions/untapped_datathon/scada_data/server_1_zip.zip

## Industry Info

There are lots of resources online with more information about Oil and Gas terminology and technology. Below are some of those resources. There is also a quick glossary of SCADA terms that you might find useful. 

### Online Resources

| Resource | Link |
| --- | --- |
| ABB O&G Production Handbook | https://library.e.abb.com/public/34d5b70e18f7d6c8c1257be500438ac3/Oil%20and%20gas%20production%20handbook%20ed3x0_web.pdf |

### Glossary

| Name/Word | Definition |
| --- | --- |
| EFM | Electronic Flow Meter, usually refers to gas meters, but sometimes refers to a liquid meter. |
| PLC | Programmable Logic Controller. Like the name indicates, these units are programmable with control system logic. They often have more memory and processing capability and are often found controlling facilities from small to large. Their primary function is to control the facility with simple logic (if this pressure is high, shutdown that pump and open this valve). |
| Plunger | This is a type of well optimization technology. A plunger is often a steel blank that travels inside the tubing. This type of optimization is designed to remove excess liquids from the well tubing so that it can flow unimpeded. If fluid builds up in the well bore then the production is often reduced. |
| Point | This is a SCADA host object that represents a sensor or monitored data point. This could be an engine temperature or a pipeline pressure. Points are also called Tags.|
| RTU | Remote Terminal Unit. These are programmable pieces of equipment that have the ability to monitor inputs and control outputs for various sensors. RTU usually refers to smaller equipment, like a SCADAPack, or Floboss, and they have less memory and processing power than PLCs which provide similar functionality. RTUs are more often used to perform flow measurement calculations than other platforms. |
| SCADA | Supervisory Control And Data Acquisition. These systems have been in use in oil and gas for a long time (since the late 1980's). They are composed of RTUs, PLCs (remote control systems), a telemetry infrastructure (data radios, cell modems), and a SCADA host server (sometimes field based, often centrally located). SCADA systems automatically control equipment, collect remote data, and gather that data into the SCADA host server. The data collected consists of alarms, equipment status, sensor readings (pressure, temperature, flow), and production measurement (hourly, daily production values). |
| Tag | See Point. |
| Tubing | This is a part of a well bore. The tubing is usually inserted into the middle of the well bore and is the piping through which the well produces fluid. The tubing will reach from the surface to the bottom of the well. |



