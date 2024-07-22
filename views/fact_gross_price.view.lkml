# The name of this view in Looker is "Fact Gross Price"
view: fact_gross_price {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GDB0041"."FACT_GROSS_PRICE" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Fiscal Year" in Explore.

  dimension: fiscal_year {

    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: gross_price {
    type: number
    sql: ${TABLE}."GROSS_PRICE" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: product_code {
    primary_key: yes
    type: number
    sql: ${TABLE}."PRODUCT_CODE" ;;
  }
  measure: count {
    type: count
  }
}
