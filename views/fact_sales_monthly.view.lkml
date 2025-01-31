view: fact_sales_monthly {
  sql_table_name: "GDB0041"."FACT_SALES_MONTHLY" ;;

  dimension: customer_code {
    primary_key: yes
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
  dimension: product_code {
    type: string
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }
  dimension: Qty {
    type: number
    sql: ${TABLE}."SOLD_QUANTITY" ;;
  }

  dimension: fiscal_year {
    type: date_year
    sql:  DATEADD(month, 4 ,To_DATE ${fact_sales_monthly.date_date} ;;
  }

  measure: count {
    type: count
  }
}
