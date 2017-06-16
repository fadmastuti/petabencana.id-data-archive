# Get data for flood event 2017-02-21

# Database connection string
DB="postgres://postgres@localhost/cognicity_prod_june_2017"
# First create a time series, then iterate and generate geojson
psql $DB -q -t -c "SELECT generate_series('2017-02-20T00:00+0700'::timestamp with time zone, '2017-02-23T00:00+0700'::timestamp with time zone, '1 hour') AT TIME ZONE 'ICT';" | while read timestamp; do
  new=`echo $timestamp | sed 's/ /T/g'`
  if [ ${#new} -gt 0 ]; then
    scripts/export-floods.sh $new'+0700' > 2017/floods/jkt_floods_$new.geojson
  fi
done
