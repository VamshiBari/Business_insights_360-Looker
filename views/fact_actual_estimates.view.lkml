view: fact_actual_estimates {
    derived_table: {
      explore_source: fact_sales_monthly {
        column: date_date { field: fact_forecast_monthly.date_date }
        column: fiscal_year { field: fact_gross_price.fiscal_year }
        column: product_code { field: fact_gross_price.product_code }
        column: Qty { field: fact_forecast_monthly.Qty }
        column: gross_price { field: fact_gross_price.gross_price }
        filters: {
          field: fact_forecast_monthly.date_date
          value: "NOT NULL"
        }
      }
    }
    dimension: date_date {
      description: ""
      type: date
    }
    dimension: fiscal_year {
      description: ""
      type: number
    }
    dimension: product_code {
      description: ""
    }
    dimension: Qty {
      description: ""
      type: number
    }
    dimension: gross_price {
      description: ""
      type: number
    }
  }
