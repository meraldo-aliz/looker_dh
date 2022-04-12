view: regional_capacity {
  derived_table: {
    sql: SELECT region_id, SUM(capacity) as total_capacity
      FROM bikeshare_station_info
      GROUP BY region_id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.region_id ;;
  }

  dimension: total_capacity {
    type: number
    sql: ${TABLE}.total_capacity ;;
  }

  set: detail {
    fields: [region_id, total_capacity]
  }
}
