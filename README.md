PetaBencana.id Data Archive
===========================

Extracts from https://petabencana.id CogniCity database.

## Data
#### floods
Flooded areas polygons, representing RW districts marked as flooded by BPBD DKI Jakarta using the PetaBencana.id Risk Evaluation Matrix.

#### reports
PetaBencana.id Flood Reports from the Jabodetabek Region of Indonesia in February 2017.

Flood reports created by residents of the Jabodetabek mega-city conurbation (Jakarta, Indonesia) using the PetaBencana.id service and other local applications.


## Metadata
Metadata records adhering to the ISO 19115-2 standard were created using https://data.gulfresearchinitiative.org/metadata-editor/.

XML representations of the records can be found in the floods/ and reports/ folders respectively.

All timestamps are UTC+7 offset for Jakarta.

## Scripts
#### export-reports.sh.

Exports reports in PetaBencana.id database between start and end times given as ISO 8601 timestamps with UTC offset. Example:

```sh
$ bash scripts/export-reports.sh 2017-02-21T00:00+0700 2017-02-21T23:59+0700 > 2017/floods/reports/petabencana.id_jbd_reports_2017-02-21.geojson
```
