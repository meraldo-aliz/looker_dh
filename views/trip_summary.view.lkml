view: trip_summary {
  derived_table: {
    explore_source: bikeshare_trips {
      column: end_name { field: end_station.name }
      column: start_name { field: start_station.name }
    }
  }
  dimension: end_name {
    description: "Public name of the station"
  }
  dimension: start_name {
    description: "Public name of the station"
  }

}
