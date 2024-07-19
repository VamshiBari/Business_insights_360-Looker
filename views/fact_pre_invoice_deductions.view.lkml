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


  measure: count {
    type: count
  }
}
