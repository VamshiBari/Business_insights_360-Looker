view: fact_forecast_monthly {
  sql_table_name: "GDB0041"."FACT_FORECAST_MONTHLY" ;;

  dimension: customer_code {
    type: number
    sql: ${TABLE}."CUSTOMER_CODE" ;;
    value_format: "0"
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

  dimension: Qty {
    type: number
    sql:  ${TABLE}. "Qty";;
  }
  dimension: product_code {
    type: number
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }
  measure: count {
    type: count
  }
}
