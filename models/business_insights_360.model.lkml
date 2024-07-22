connection: "business_insights_360"

# include all the views
include: "/views/**/*.view.lkml"


datagroup: business_insights_360_default_datagroup {
   #sql_trigger: SELECT MAX(date) FROM fact_forecast_monthly ;;
  max_cache_age: "1 hour"
}

persist_with: business_insights_360_default_datagroup

explore: dim_customer {}

explore: dim_date {}

explore: dim_product {}

explore: fact_forecast_monthly {


}
explore: fact_freight_cost {}


explore: fact_manufacturing_cost {}

explore: fact_post_invoice_deductions {}


explore: fact_sales_monthly {}
