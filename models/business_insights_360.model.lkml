connection: "business_insights_360"

# include all the views
include: "/views/**/*.view.lkml"


datagroup: business_insights_360_default_datagroup {
   #sql_trigger: SELECT MAX(date) FROM fact_forecast_monthly ;;
  interval_trigger: "24 hours"
  max_cache_age: "1 hour"
}

persist_with: business_insights_360_default_datagroup

explore: dim_customer {}

explore: dim_date {}

explore: dim_product {}

explore: fact_forecast_monthly {
  join: dim_customer {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_forecast_monthly.customer_code} = ${dim_customer.customer_code} ;;
  }
 join: dim_product {
   type: left_outer
  relationship: many_to_one
  sql_on: ${fact_forecast_monthly.product_code} = ${dim_product.product_code};;
 }
join: fact_pre_invoice_deductions {
  type: left_outer
  relationship: many_to_one
  sql_on: ${fact_forecast_monthly.customer_code} = ${fact_pre_invoice_deductions.customer_code} ;;
}
join: fact_post_invoice_deductions {
  type: left_outer
  relationship: many_to_one
  sql_on: ${fact_forecast_monthly.customer_code} = ${fact_post_invoice_deductions.customer_code} ;;
}
join: fact_gross_price {
  type: left_outer
  relationship: many_to_one
  sql_on: ${fact_forecast_monthly.product_code} = ${fact_gross_price.product_code} ;;
  }
}

explore: fact_freight_cost {}


explore: fact_manufacturing_cost {}

explore: fact_post_invoice_deductions {}
explore: fact_pre_invoice_deductions {}

explore: fact_sales_monthly {}
explore: fact_actuals_estimates {
  join: fact_post_invoice_deductions {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_actuals_estimates.customer_code} =  ${fact_post_invoice_deductions.customer_code};;
  }
  join: fact_manufacturing_cost {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_actuals_estimates.product_code} = ${fact_manufacturing_cost.product_code} ;;
  }
  join: fact_freight_cost {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_actuals_estimates.fiscal_year} = ${fact_freight_cost.fiscal_year} ;;
  }
}
