# The name of this view in Looker is "Fact Forecast Monthly"
view: fact_forecast_monthly {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GDB0041"."FACT_FORECAST_MONTHLY" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Customer Code" in Explore.

  dimension: customer_code {
    primary_key: yes
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

  dimension: product_code {
    type: string
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}."QTY" ;;
  }
  dimension: gross_sales_amount {
    type: number
    sql: ${qty}*${fact_gross_price.gross_price} ;;
  }
  dimension: pre_invoice_disount_amount {
    type: number
    sql: ${gross_sales_amount}*${fact_pre_invoice_deductions.pre_invoice_discount_pct} ;;
  }
  dimension: net_invoice_sales_amount {
    type: number
    sql: ${gross_sales_amount} - ${pre_invoice_disount_amount} ;;
    value_format: "0.00"
  }

  dimension: net_sales_discount_pct {
    type: number
    sql: ${net_invoice_sales_amount}*${fact_post_invoice_deductions.discounts_pct};;
 value_format: "0.00"
 }
dimension: nect_sales_other_discounts_pct{
  type: number
  sql: ${net_invoice_sales_amount}*${fact_post_invoice_deductions.other_deductions_pct};;
}
dimension: net_sales {
  type: number
  sql: ${net_invoice_sales_amount} - ${net_sales_discount_pct} - ${nect_sales_other_discounts_pct};;
  value_format: "0.0"
}
measure: gross_sales_dollars{
  type: sum
  sql: ${gross_sales_amount}  ;;
value_format_name:usd}
}

