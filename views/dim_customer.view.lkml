view: dim_customer {
  sql_table_name: "GDB0041"."DIM_CUSTOMER" ;;

  dimension: channel {
    type: string
    sql: ${TABLE}."CHANNEL" ;;
  }
  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }
  dimension: customer_code {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUSTOMER_CODE" ;;
  }
  dimension: market {
    type: string
    sql: ${TABLE}."MARKET" ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}."PLATFORM" ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }
  dimension: sub_zone {
    type: string
    sql: ${TABLE}."SUB_ZONE" ;;
  }
  measure: count {
    type: count
  }
}
