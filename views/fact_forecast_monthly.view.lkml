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
    type: number
    sql: ${TABLE}."CUSTOMER_CODE" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_customer_code {
    type: sum
    sql: ${customer_code} ;;  }
  measure: average_customer_code {
    type: average
    sql: ${customer_code} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
  measure: count {
    type: count
  }
}
