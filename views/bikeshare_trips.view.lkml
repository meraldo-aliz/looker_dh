view: bikeshare_trips {
  sql_table_name: `san_francisco_bikeshare.bikeshare_trips`
    ;;

  dimension: bike_number {
    type: number
    description: "IDs of bike used"
    sql: ${TABLE}.bike_number ;;
  }

  dimension: bike_share_for_all_trip {
    type: string
    sql: ${TABLE}.bike_share_for_all_trip ;;
  }

  dimension: c_subscription_type {
    type: string
    sql: ${TABLE}.c_subscription_type ;;
  }

  dimension: duration_sec {
    type: number
    description: "Time of trip in seconds"
    sql: ${TABLE}.duration_sec ;;
  }

  dimension_group: end {
    type: time
    description: "End date of trip with date and time, in PST"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date ;;
  }


  dimension: end_station_id {
    type: number
    description: "Numeric reference for end station"
    sql: ${TABLE}.end_station_id ;;
  }
 dimension: member_birth_year {
    type: number
    sql: ${TABLE}.member_birth_year ;;
  }


  dimension: member_gender {
    type: string
    sql: ${TABLE}.member_gender ;;
  }



  dimension_group: start {
    type: time
    description: "Start date of trip with date and time, in PST"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }



  dimension: subscriber_type {
    type: string
    description: "Subscriber = annual or 30-day member; Customer = 24-hour or 3-day member"
    sql: ${TABLE}.subscriber_type ;;
  }

  dimension: trip_id {
    type: string
    description: "Numeric ID of bike trip"
    primary_key: yes
    sql: ${TABLE}.trip_id ;;
  }

  dimension: zip_code {
    type: zipcode
    description: "Home zip code of subscriber (customers can choose to manually enter zip at kiosk however data is unreliable)"
    sql: ${TABLE}.zip_code ;;
  }


  # new
  dimension: member_age {
    type: number
    sql: EXTRACT(YEAR FROM CURRENT_TIMESTAMP()) - ${member_birth_year} ;;
  }


  # new
  dimension: member_age_tier {
    case: {
      when: {
        sql: ${member_age} <= 60;;
        label: "Adults"
      }
      when: {
        sql: ${member_age} > 60;;
        label: "Seniors"
      }
      else:"Unknown"
    }
    drill_fields: [member_age]
  }

}
