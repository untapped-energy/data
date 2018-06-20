## Untapped Oil &amp; Gas Datathon ##

### What Is This? ###
This repository will be used to collect data in advance of the datathon event on October 12th to October 14th, 2018. You can submit data using the data upload tool below.

### Visibility of Data ###
Currently this is a public repository. The intention is to make it a private repository shortly so that sensitive data is not exposed to the world. My thoughts are to build another tool that attendees of the datathon would use to review the terms and conditions of data access, agree to them, and then be provided with access to the private repository.

### Data Upload Tool ###

Visit https://sharp-edison-5440cb.netlify.com to access the upload tool. For those interested, this tool is built with netlify, serverless (Amazon Lambda), and S3.

The form accepts any type of file. My intention is to add some basic metadata analysis, for instance, detecting the names of columns in CSV files, etc. The metadata (currently just the description you enter in the upload tool) will be placed in a separate file that has the same name as your uploaded data file, but appended with .metadata.txt.

I am very open to suggestions to improve this tool and process!