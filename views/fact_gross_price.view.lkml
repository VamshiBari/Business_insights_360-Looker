view: fact_gross_price {
  sql_table_name: "GDB0041"."FACT_GROSS_PRICE" ;;

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }
  dimension: gross_price {
    type: number
    sql: ${TABLE}."GROSS_PRICE" ;;
  }
  dimension: product_code {
    type: string
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }
  measure: gross_sales_price {
    type: number
    sql: ${fact_forecast_monthly.Qty}*${gross_price};;
    }

  measure: count {
    type: count
  }
}
