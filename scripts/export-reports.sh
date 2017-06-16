#!/bin/bash
# ------------------------------------------------------------------- #
# Export reports from PetaBencana.id PostgreSQL database as GeoJSON
#
# Useage
# $ export-reports.sh [start] [end]
#
# State and end timestamps should be in ISO8601 format with UTC offset.
#
# All output times are converted to UTC+7.
#
# Tomas Holderness, MIT Urban Risk Lab
# June 2017
# -------------------------------------------------------------------- #

# Database connection string
DB="postgres://postgres@localhost/cognicity_prod_june_2017"

# Get day
start=$1
end=$2

# Run query
#psql $DB -c "SELECT * FROM cognicity.all_reports WHERE created_at >= '$1' AND created_at <= '$2' LIMIT 100;"


psql $DB --no-align -t -q -c "SELECT row_to_json(fc) FROM (SELECT 'FeatureCollection' AS type, array_to_json(array_agg(f)) AS features \
FROM (SELECT 'Feature' AS type, \
			ST_ASGeoJSON(lg.the_geom)::json AS geometry, \
				row_to_json( \
					(SELECT l FROM \
						(SELECT \
						lg.created_at at time zone 'ICT' created_at, \
						lg.source, \
						lg.image_url, \
						lg.title, \
            lg.report_data, \
            lg.tags,
						lg.text) \
					 AS l) \
				 ) AS properties \
				 FROM  cognicity.all_reports AS lg, cognicity.instance_regions as regions \
WHERE lg.created_at >= '$1'::timestamp WITH TIME ZONE \
	AND lg.created_at <= '$2'::timestamp WITH TIME ZONE \
  AND regions.code = 'jbd' \
	AND ST_Within(lg.the_geom, regions.the_geom) \
) AS f)
AS fc;"
