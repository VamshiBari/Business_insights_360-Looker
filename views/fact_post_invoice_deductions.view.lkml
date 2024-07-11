view: fact_post_invoice_deductions {
  sql_table_name: "GDB0041"."FACT_POST_INVOICE_DEDUCTIONS" ;;

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
  dimension: discounts_pct {
    type: number
    sql: ${TABLE}."DISCOUNTS_PCT" ;;
  }
  dimension: other_deductions_pct {
    type: number
    sql: ${TABLE}."OTHER_DEDUCTIONS_PCT" ;;
  }
  dimension: product_code {
    type: string
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }
  measure: count {
    type: count
  }
}
