# SCADA Data

This data represents a raw data dump of data from several SCADA servers. The bulk of the data is in the time-series historical data. The SCADA host has an internal structure that represents the producer's areas, fields, wells, meters and sensors. Each object in the SCADA host database is identified by a unique Id number. You can use this object Id to join the metadata with the historical data. 

There are several files being uploaded for each server. wells.csv, meters.csv, points.csv all contain metadata for the various objects in the system. Historic_data contains csv files of the point's history, each csv is named with the point's Id number.  

## Tasks

- [x] Export metadata from server_1
- [ ] Upload metadata from server_1
- [ ] Export historic data from server_1
- [ ] Upload historic data from server_1

## Server 1 Files

This is SCADA data from a tier 2 producer with properties all over Alberta. Focusing efforts on uploading data from Central Alberta first and will expand data collection as time permits. Areas covered will be near Nordegg, Rocky Mountain House, Sundre, and Caroline. 

- wells.csv - contains a list of all the wells in the system. 
- meters.csv - contains a list of the EFM meters in the system and their configuration (includes gas composition/quality). 
- analog_points.csv - contains a list of all the analog points in the system and their metadata.
- digital_points.csv - contains a list of all the digital/discrete points in the system and their metadata.
- historic_data - this folder contains the point history, one file per point. History is from Sept 2017 to Sept 2018. 


## Glossary

| Name/Word | Definition |
| --- | --- |
| EFM | Electronic Flow Meter, usually refers to gas meters, but sometimes refers to a liquid meter. |
| PLC | Programmable Logic Controller. Like the name indicates, these units are programmable with control system logic. They often have more memory and processing capability and are often found controlling facilities from small to large. Their primary function 
| RTU | Remote Terminal Unit. These are programmable pieces of equipment that have the ability to monitor inputs and control outputs for various sensors. RTU usually refers to smaller equipment, like a SCADAPack, or Floboss, and they have less memory and processing power than PLCs which provide similar functionality. RTUs are more often used to perform flow measurement calculations than other platforms. |
| SCADA | Supervisory Control And Data Acquisition. These systems have been in use in oil and gas for a long time (since the late 1980's). They are composed of RTUs, PLCs (remote control systems), a telemetry infrastructure (data radios, cell modems), and a SCADA host server (sometimes field based, often centrally located). SCADA systems automatically control equipment, collect remote data, and gather that data into the SCADA host server. The data collected consists of alarms, equipment status, sensor readings (pressure, temperature, flow), and production measurement (hourly, daily production values). |



