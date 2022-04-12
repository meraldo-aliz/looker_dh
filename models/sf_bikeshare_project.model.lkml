connection: "sf_bike_connection"

# include all the views
include: "/views/**/*.view"

datagroup: sf_bikeshare_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sf_bikeshare_project_default_datagroup

explore: bikeshare_station_status {}

explore: bikeshare_station_info {
  label: "Bikeshare Station Info"
  join: bikeshare_regions {
    type: left_outer
    sql_on: ${bikeshare_station_info.region_id} =  ${bikeshare_regions.region_id};;
    relationship: many_to_one
  }

}

explore: trip_summary {}

explore: bikeshare_regions {}


explore: regional_capacity {}

explore: bikeshare_trips {

  join:  start_station{
    from:  bikeshare_station_info
    type: left_outer
    sql_on: ${start_station.station_id} = ${bikeshare_trips.start_station_id};;
    relationship: many_to_one
    fields: [start_station.station_id, start_station.location, start_station.name]
  }

  join:  end_station{
    from: bikeshare_station_info
    type: left_outer
    sql_on: ${end_station.station_id} = ${bikeshare_trips.end_station_id};;
    relationship: many_to_one
    fields: [end_station.station_id, end_station.location, end_station.name]
  }

}
