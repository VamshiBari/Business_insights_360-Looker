view: fact_forecast_monthly {
  sql_table_name: "GDB0041"."FACT_FORECAST_MONTHLY" ;;

  dimension: customer_code {
    type: number
    sql: ${TABLE}."CUSTOMER_CODE" ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }
  dimension: fiscal_year {
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }
  dimension: forecast_quantity {
    type: number
    sql: ${TABLE}."FORECAST_QUANTITY" ;;
  }
  dimension: product_code {
    type: string
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }
  measure: count {
    type: count
  }
}
