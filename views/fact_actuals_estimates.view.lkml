# If necessary, uncomment the line below to include explore_source.
# include: "business_insights_360.model.lkml"

view: fact_actuals_estimates {
  derived_table: {
    explore_source: fact_forecast_monthly {
      column: date_date {}
      column: customer_code {}
      column: customer { field: dim_customer.customer }
      column: qty {}
      column: fiscal_year {}
      column: gross_price { field: fact_gross_price.gross_price }
      column: gross_sales_amount {}
      column: pre_invoice_discount_pct { field: fact_pre_invoice_deductions.pre_invoice_discount_pct }
      column: pre_invoice_disount_amount {}
      column: net_invoice_sales_amount {}
    }
  }
  dimension: date_date {
    description: ""
    type: date
  }
  dimension: customer_code {
    primary_key: yes
    description: ""
    value_format: "0"
    type: number
  }
  dimension: customer {
    description: ""
  }
  dimension: qty {
    description: ""
    type: number
  }
  dimension: fiscal_year {
    description: ""
    type: number
  }
  dimension: gross_price {
    description: ""
    type: number
  }
  dimension: gross_sales_amount {
    description: ""
    type: number
  }
  dimension: pre_invoice_discount_pct {
    description: ""
    type: number
  }
  dimension: pre_invoice_disount_amount {
    description: ""
    type: number
  }
  dimension: net_invoice_sales_amount {
    description: ""
    type: number
  }
}
