view: bikeshare_station_status {
  sql_table_name: `san_francisco_bikeshare.bikeshare_station_status`
    ;;

  dimension: eightd_has_available_keys {
    type: yesno
    sql: ${TABLE}.eightd_has_available_keys ;;
  }

  dimension: is_installed {
    type: yesno
    description: "1/0 boolean - is the station currently on the street"
    sql: ${TABLE}.is_installed ;;
  }

  dimension: is_renting {
    type: yesno
    description: "1/0 boolean - is the station currently renting bikes (even if the station is empty, if it is set to allow rentals this value should be 1)"
    sql: ${TABLE}.is_renting ;;
  }

  dimension: is_returning {
    type: yesno
    description: "1/0 boolean - is the station accepting bike returns (if a station is full but would allow a return if it was not full then this value should be 1)"
    sql: ${TABLE}.is_returning ;;
  }

  dimension: last_reported {
    type: number
    description: "Integer POSIX timestamp indicating the last time this station reported its status to the backend"
    sql: ${TABLE}.last_reported ;;
  }

  dimension: num_bikes_available {
    type: number
    description: "Number of bikes available for rental"
    sql: ${TABLE}.num_bikes_available ;;
  }

  dimension: num_bikes_disabled {
    type: number
    description: "Number of disabled bikes at the station. Vendors who do not want to publicize the number of disabled bikes or docks in their system can opt to omit station capacity (in station_information), num_bikes_disabled and num_docks_disabled. If station capacity is published then broken docks/bikes can be inferred (though not specifically whether the decreased capacity is a broken bike or dock)"
    sql: ${TABLE}.num_bikes_disabled ;;
  }

  dimension: num_docks_available {
    type: number
    description: "Number of docks accepting bike returns"
    sql: ${TABLE}.num_docks_available ;;
  }

  dimension: num_docks_disabled {
    type: number
    description: "Number of empty but disabled dock points at the station. This value remains as part of the spec as it is possibly useful during development"
    sql: ${TABLE}.num_docks_disabled ;;
  }

  dimension: num_ebikes_available {
    type: number
    sql: ${TABLE}.num_ebikes_available ;;
  }

  dimension: station_id {
    type: number
    description: "Unique identifier of a station"
    sql: ${TABLE}.station_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
