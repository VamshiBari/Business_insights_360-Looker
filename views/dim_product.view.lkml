view: dim_product {
  sql_table_name: "GDB0041"."DIM_PRODUCT" ;;

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }
  dimension: division {
    type: string
    sql: ${TABLE}."DIVISION" ;;
  }
  dimension: product {
    type: string
    sql: ${TABLE}."PRODUCT" ;;
  }
  dimension: product_code {
    primary_key: yes
    type: string
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }
  dimension: segment {
    type: string
    sql: ${TABLE}."SEGMENT" ;;
  }
  dimension: variant {
    type: string
    sql: ${TABLE}."VARIANT" ;;
  }
  measure: count {
    type: count
  }
}
