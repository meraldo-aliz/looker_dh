connection: "sf_bike_connection"

# include all the views
include: "/views/**/*.view"

datagroup: sf_bikeshare_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sf_bikeshare_project_default_datagroup

explore: bikeshare_station_status {


  }


explore: bikeshare_station_info {
  join: bikeshare_regions {
    type:  left_outer
    sql_on:  ${bikeshare_station_info.region_id}=${bikeshare_regions.region_id} ;;
    relationship: many_to_one
}}


explore: bikeshare_regions {}



explore: bikeshare_trips {}
