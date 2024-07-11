view: fact_manufacturing_cost {
  sql_table_name: "GDB0041"."FACT_MANUFACTURING_COST" ;;

  dimension: cost_year {
    type: number
    sql: ${TABLE}."COST_YEAR" ;;
  }
  dimension: manufacturing_cost {
    type: number
    sql: ${TABLE}."MANUFACTURING_COST" ;;
  }
  dimension: product_code {
    type: string
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }
  measure: count {
    type: count
  }
}
