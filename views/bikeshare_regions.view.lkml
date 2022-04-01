view: bikeshare_regions {
  sql_table_name: `san_francisco_bikeshare.bikeshare_regions`
    ;;

  dimension: name {
    type: string
    description: "Public name for this region"
    sql: ${TABLE}.name ;;
  }

  dimension: region_id {
    type: number
    description: "Unique identifier for the region"
    primary_key: yes
    sql: ${TABLE}.region_id ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
