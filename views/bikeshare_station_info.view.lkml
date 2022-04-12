view: bikeshare_station_info {
  sql_table_name: `san_francisco_bikeshare.bikeshare_station_info`
    ;;

  dimension: capacity {
    type: number
    description: "Number of total docking points installed at this station, both available and unavailable"
    sql: ${TABLE}.capacity ;;
  }

  dimension: eightd_has_key_dispenser {
    type: yesno
    sql: ${TABLE}.eightd_has_key_dispenser ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: has_kiosk {
    type: yesno
    sql: ${TABLE}.has_kiosk ;;
  }

  # new
  dimension: lat {
    hidden:  yes
    type: number
    description: "The latitude of station. The field value must be a valid WGS 84 latitude in decimal degrees format. See: http://en.wikipedia.org/wiki/World_Geodetic_System, https://en.wikipedia.org/wiki/Decimal_degrees"
    sql: ${TABLE}.lat ;;
  }


  # new
  dimension: lon {
    hidden: yes
    type: number
    description: "The longitude of station. The field value must be a valid WGS 84 longitude in decimal degrees format. See: http://en.wikipedia.org/wiki/World_Geodetic_System, https://en.wikipedia.org/wiki/Decimal_degrees"
    sql: ${TABLE}.lon ;;
  }

  dimension: location { type: location
    sql_latitude: $(lat);;
    sql_longitude: $(lon);;
    }

  dimension: name {
    type: string
    description: "Public name of the station"
    sql: ${TABLE}.name ;;
  }

  dimension: region_id {
    type: number
    description: "ID of the region where station is located"
    sql: ${TABLE}.region_id ;;
  }

  dimension: rental_methods {
    type: string
    description: "Array of enumerables containing the payment methods accepted at this station.  Current valid values (in CAPS) are: KEY (i.e. operator issued bike key / fob / card) CREDITCARD PAYPASS APPLEPAY ANDROIDPAY TRANSITCARD ACCOUNTNUMBER PHONE This list is intended to be as comprehensive at the time of publication as possible but is subject to change, as defined in File Requirements above"
    sql: ${TABLE}.rental_methods ;;
  }

  dimension: short_name {
    type: string
    description: "Short name or other type of identifier, as used by the data publisher"
    sql: ${TABLE}.short_name ;;
  }

  # new
  dimension: station_geom {
    hidden:  yes
    type: string
    sql: ${TABLE}.station_geom ;;
  }

  dimension: station_id {
    type: number
    description: "Unique identifier of a station."
    primary_key: yes
    sql: ${TABLE}.station_id ;;
  }

  measure: count {
    type: count
    drill_fields: [name, short_name]
  }

# new
  dimension: location {
    type: location
    sql_latitude:${lat} ;;
    sql_longitude:${lon} ;;
  }

  # new
  measure: total_capacity {
    type: sum
    sql: ${capacity} ;;
  }

  # new
  measure: total_kiosk_station_capacity {
    type: sum
    sql: ${capacity} ;;
    filters: [has_kiosk: "Yes"]
  }


}
