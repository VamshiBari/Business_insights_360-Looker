- name: Gross_marign_amount
  title: Untitled Visualization
  model: business_insights_360
  explore: fact_actuals_estimates
  type: table
  fields: [fact_actuals_estimates.date_date, fact_actuals_estimates.customer, fact_actuals_estimates.customer_code,
    fact_actuals_estimates.product_code, fact_actuals_estimates.fiscal_year, fact_actuals_estimates.net_invoice_sales_amount,
    fact_post_invoice_deductions.discounts_pct, fact_post_invoice_deductions.other_deductions_pct,
    fact_manufacturing_cost.manufacturing_cost]
  sorts: [fact_actuals_estimates.date_date desc]
  limit: 500
  column_limit: 50
  dynamic_fields:
  - category: table_calculation
    expression: "${fact_actuals_estimates.net_invoice_sales_amount}*${fact_post_invoice_deductions.discounts_pct}"
    label: Net_Invoice_Sales_discounts_pct
    value_format:
    value_format_name: usd
    _kind_hint: dimension
    table_calculation: net_invoice_sales_discounts_pct
    _type_hint: number
  - category: table_calculation
    expression: "${net_invoice_sales_discounts_pct}*${fact_post_invoice_deductions.other_deductions_pct}"
    label: Net_invoice_sales_other_discounts_pct
    value_format:
    value_format_name: usd
    _kind_hint: dimension
    table_calculation: net_invoice_sales_other_discounts_pct
    _type_hint: number
  - category: table_calculation
    expression: "${fact_actuals_estimates.net_invoice_sales_amount} -${net_invoice_sales_discounts_pct}-${net_invoice_sales_other_discounts_pct}"
    label: Net_Sales
    value_format:
    value_format_name: usd
    _kind_hint: dimension
    table_calculation: net_sales
    _type_hint: number
  - category: table_calculation
    expression: "${net_sales} - ${fact_manufacturing_cost.manufacturing_cost}"
    label: Gross_margin_amount
    value_format:
    value_format_name: usd
    _kind_hint: dimension
    table_calculation: gross_margin_amount
    _type_hint: number
