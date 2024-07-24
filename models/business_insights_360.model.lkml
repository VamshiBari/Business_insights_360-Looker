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

explore: +fact_forecast_monthly {
  aggregate_table: rollup__date_date__dim_customer_customer__dim_customer_customer_code__dim_product_product_code__fact_gross_price_gross_price__fact_post_invoice_deductions_discounts_pct__fact_post_invoice_deductions_other_deductions_pct__fact_pre_in {
    query: {
      dimensions: [
        date_date,
        dim_customer.customer,
        dim_customer.customer_code,
        dim_product.product_code,
        fact_gross_price.gross_price,
        fact_post_invoice_deductions.discounts_pct,
        fact_post_invoice_deductions.other_deductions_pct,
        fact_pre_invoice_deductions.pre_invoice_discount_pct,
        qty
      ]
      measures: [gross_sales_amount, net_invoice_sales_amount, net_sales]
      timezone: "Asia/Calcutta"
    }

    materialization: {
      datagroup_trigger: business_insights_360_default_datagroup
    }
  }
}
