PetaBencana.id Data Archive
===========================

Extracts from https://petabencana.id CogniCity database.

## Data
### 1 Floods
Flooded areas polygons, representing RW districts marked as flooded by BPBD DKI Jakarta using the PetaBencana.id Risk Evaluation Matrix.

Reports are in GeoJSON format. Each GeoJSON feature represents a flooded area.

**Report Attributes**

|Attribute name|Description|Type|
|--------------|-----------|----|
|geom_id|Identifying number of local areas (RW, see below)|Integer|
|changed|The time the area was marked as flooded|String|
|state|The level of flooding (see below)|Integer|

**State Attribute**

|State|Severity|Description|
|-----|--------|-----------|
|1|Unknown|Unknown level of flooding - use caution|
|2|Minor|Flooding between 10 and 70 cm|
|3|Moderate|Flooding between 71 and 150 cm|
|4|Severe|Flooding over 150 cm|

**Time**
All timestamps are UTC+7 offset for Jakarta.

**Coordinate Reference System**
Data follows GeoJSON specification and coordinates are in WGS84 geographic coordinate system.

**Geometry ID**
Unique polygon identifier for RWs as created by Humanitarian Open Street Map Team

### 2 Reports
PetaBencana.id Flood Reports from the Jabodetabek Region of Indonesia in February 2017.

Flood reports created by residents of the Jabodetabek mega-city conurbation (Jakarta, Indonesia) using the PetaBencana.id service and other local applications.

Reports are in GeoJSON format. Each GeoJSON feature represents an individual report.

**Report Attributes**

|Attribute name|Description|Type|
|--------------|-----------|----|
|created_at|Time that report was created as recorded by the user's device|String|
|source|The originating source of the report (see below)|String|
|image_url|Link to report image if available|String|
|title|Title of the report if available|String|
|report_data|Flood depth if available|JSON|
|tags|Instance region and RW containing report if available|JSON|
|text|Report description|String|

**Source Attribute**
Source may be one of, 'qlue' (http://qlue.co.id/site/), 'detik' (https://pasangmata.detik.com/), 'grasp' (petabencana.id chatbot).

**Time**
All timestamps are UTC+7 offset for Jakarta.

**Coordinate Reference System**
Data follows GeoJSON specification and coordinates are in WGS84 geographic coordinate system.

## Metadata
Metadata records adhering to the ISO 19115-2 standard were created using https://data.gulfresearchinitiative.org/metadata-editor/. An XML representation of the data can be found in the floods/ and reports/ folders respectively.

## Scripts
#### $ export-reports.sh

Exports reports in PetaBencana.id database between start and end times given as ISO 8601 timestamps with UTC offset. Example:

```sh
$ bash scripts/export-reports.sh 2017-02-21T00:00+0700 2017-02-21T23:59+0700 > 2017/floods/reports/petabencana.id_jbd_reports_2017-02-21.geojson
```

The build-reports-data-february-2017.sh is a wrapper around this script for specific flood events.

#### $ export-floods.sh

Exports floods in PetaBencana.id database at a specific time as given in ISO 8601 timestamps with UTC offset. Example:

```sh
$ bash scripts/export-floods.sh 2017-02-21T00:00+0700
```

The build-floods-data-february-2017.sh is a wrapper around this script for specific flood events.
