
view: newderived {
  derived_table: {
    explore_source: bikeshare_station_info {
      column: count {}
      column: region_id {}
      column: name { field: bikeshare_regions.name }
    }
  }
  dimension: count {
    description: ""
    type: number
  }
  dimension: region_id {
    description: "ID of the region where station is located"
    type: number
  }
  dimension: name {
    description: "Public name for the region"
  }
}
