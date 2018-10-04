SCADA Data

Wilson Creek files are a sample of data from a live SCADA host. 

TODO - Cleanup this Readme file and add some more content regarding the schema of the data. 

WilsonCreekEvents - this is a dump of the SCADA software event log. It includes alarms, user/operator actions, sensor/equipment events and more. The Source identifies the object that is associated with the event and can be cross referenced against the point information. 

WilsonCreekPoints - This is a dump of all the points (which can be thought of as 'sensors' or points of information) being monitored by the SCADA host, their FullName, current value and last updated time. 

WilsonCreek01-04-043-04W5History1Mo - This is a sample of historical data. To keep the file size down it lists the Id number of the point (cross reference to the point information), the value and the time the value was recorded. This is only a month's worth of data for a single well... there are 80,000 rows. Trying to figure out how to best handle more historical data. In the SCADA host it is stored in a time series database.
