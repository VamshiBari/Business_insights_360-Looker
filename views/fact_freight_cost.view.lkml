view: fact_freight_cost {
  sql_table_name: "GDB0041"."FACT_FREIGHT_COST" ;;

  dimension: fiscal_year {
    primary_key: yes
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }
  dimension: freight_pct {
    type: number
    sql: ${TABLE}."FREIGHT_PCT" ;;
  }
  dimension: market {
    type: string
    sql: ${TABLE}."MARKET" ;;
  }
  dimension: other_cost_pct {
    type: number
    sql: ${TABLE}."OTHER_COST_PCT" ;;
  }
  measure: count {
    type: count
  }
}
