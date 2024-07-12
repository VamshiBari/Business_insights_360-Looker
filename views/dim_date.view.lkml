view: dim_date{
  derived_table: {
    sql:


      SELECT
          (TO_CHAR(TO_DATE(fact_forecast_monthly."DATE" ), 'YYYY-MM-DD')) AS "fact_forecast_monthly.date_date"
      FROM "GDB0041"."FACT_FORECAST_MONTHLY"  AS fact_forecast_monthly
      GROUP BY
          (TO_DATE(fact_forecast_monthly."DATE" ))
      ORDER BY
          1 DESC
      FETCH NEXT 5000 ROWS ONLY ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fact_forecast_monthly_date_date {
    type: string
    sql: ${TABLE}."fact_forecast_monthly.date_date" ;;
  }

  dimension: fiscal_year {
    type: date
    sql:  DATEADD(month, 4 ,To_DATE ${fact_forecast_monthly_date_date}) ;;
  }

  set: detail {
    fields: [
      fact_forecast_monthly_date_date
    ]
  }
}
