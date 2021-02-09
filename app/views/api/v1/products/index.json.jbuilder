json.total_count @products.count
json.products @products do |product|
  json.name product.name
  json.material_code product.material_code
  json.product_category_code product.category
end