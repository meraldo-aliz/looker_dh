 view: capacity {

 derived_table: {
sql: Select region_id,sum(capacity) as capacity from bikeshare_station_info group by region_id ;;}
}
