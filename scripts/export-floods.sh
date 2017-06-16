#!/bin/bash
# ------------------------------------------------------------------- #
# Export floods (flood affected areas) from PetaBencana.id PostgreSQL
# database as GeoJSON
#
# Useage
# $ export-floods.sh [timestamp]
#
# Timestamp should be in ISO8601 format with UTC offset.
#
# All output times are converted to UTC+7.
#
# Tomas Holderness, MIT Urban Risk Lab
# June 2017
# -------------------------------------------------------------------- #

# Database connection string
DB="postgres://postgres@localhost/cognicity_prod_june_2017"

# Timestamp
ts=$1

psql $DB --no-align -t -q -c "SELECT row_to_json(fc) FROM (SELECT 'FeatureCollection' AS type, array_to_json(array_agg(f)) AS features \
FROM (SELECT 'Feature' AS type, \
			ST_ASGeoJSON(lg.the_geom)::json AS geometry, \
				row_to_json( \
					(SELECT l FROM \
						(SELECT \
            lg.geom_id, \
						lg.changed at time zone 'ICT' changed, \
						lg.state) \
					 AS l) \
				 ) AS properties \
				 FROM (SELECT geom_id, changed, state, the_geom FROM \
         cognicity.rem_get_flood('$1'::timestamp with time zone) as floods, \
         cognicity.local_areas as rw WHERE floods.local_area = rw.pkey) AS lg \
) AS f)
AS fc;"
