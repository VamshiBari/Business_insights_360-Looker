view: final_fact_actual_estimates {
    derived_table: {
      explore_source: fact_forecast_monthly {
        column: date_date {}
        column: customer { field: dim_customer.customer }
        column: customer_code { field: dim_customer.customer_code }
        column: product_code { field: dim_product.product_code }
        column: fiscal_year {}
        column: qty {}
        column: gross_price { field: fact_gross_price.gross_price }
        column: gross_sales_amount {}
        column: net_invoice_sales_amount {}
        column: net_sales {}
      }
      datagroup_trigger:  business_insights_360_default_datagroup
    }
    dimension: date_date {
      description: ""
      type: date
    }
    dimension: customer {
      description: ""
    }
    dimension: customer_code {
      description: ""
      primary_key: yes
    }
    dimension: product_code {
      description: ""
    }
    dimension: fiscal_year {
      description: ""
      type: number
    }
    dimension: qty {
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
    dimension: net_invoice_sales_amount {
      description: ""
      value_format: "0.00"
      type: number
    }
    dimension: net_sales {
      description: ""
      value_format: "0.0"
      type: number
    }
  }
