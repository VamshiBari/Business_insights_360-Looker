view: fact_pre_invoice_deductions {
  sql_table_name: "GDB0041"."FACT_PRE_INVOICE_DEDUCTIONS" ;;

  dimension: customer_code {
    type: number
    sql: ${TABLE}."CUSTOMER_CODE" ;;
  }
  dimension: fiscal_year {
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }
  dimension: pre_invoice_discount_pct {
    type: number
    sql: ${TABLE}."PRE_INVOICE_DISCOUNT_PCT" ;;
  }
  measure: pre_invoice_discount_amount {
    type:number
    sql: ${fact_gross_price.gross_sales_price}* ${pre_invoice_discount_pct} ;;
  }

measure: net_preinvoice_sales_amount {
  type: number
  sql: ${fact_gross_price.gross_sales_price} - ${pre_invoice_discount_amount} ;;
  value_format: "$0.00"
}

  measure: count {
    type: count
  }
}
