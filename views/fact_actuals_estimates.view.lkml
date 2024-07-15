view: fact_actuals_estimates {
    derived_table: {
      explore_source: fact_forecast_monthly {
        column: date_date {}
        column: customer_code {}
        column: customer { field: dim_customer.customer }
        column: Qty {}
        column: fiscal_year {}
        column: gross_price { field: fact_gross_price.gross_price }
        column: gross_sales_price { field: fact_gross_price.gross_sales_price }
        column: pre_invoice_discount_pct { field: fact_pre_invoice_deductions.pre_invoice_discount_pct }
        column: pre_invoice_discount_amount { field: fact_pre_invoice_deductions.pre_invoice_discount_amount }
        column: net_preinvoice_sales_amount { field: fact_pre_invoice_deductions.net_preinvoice_sales_amount }
      }
    }
    dimension: date_date {
      description: ""
      type: date
    }
    dimension: customer_code {
      description: ""
      value_format: "0"
      type: number
    }
    dimension: customer {
      description: ""
    }
    dimension: Qty {
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
    dimension: gross_sales_price {
      description: ""
      type: number
    }
    dimension: pre_invoice_discount_pct {
      description: ""
      type: number
    }
    dimension: pre_invoice_discount_amount {
      description: ""
      type: number
    }
    dimension: net_preinvoice_sales_amount {
      description: ""
      value_format: "$0.00"
      type: number
    }
  }
