require 'csv'

class Product < ApplicationRecord

  ## validation macros
  validates_presence_of :name, :category, :material_code
  validates_uniqueness_of :material_code

  ## enums prefer the hash syntax
  enum status: { available: 0, unavailable: 1 }

  ## Methods
  def self.import_csv(file)
    if File.extname(file.original_filename) == ".csv"
      csv_file = File.read(file.path)
      CSV.parse(csv_file, headers: true) do |row|
        row = row.to_h
        # below is to remove extra characters from csv which are not visible
        row.transform_keys!{ |k| k.gsub("\xEF\xBB\xBF","") }
        product = Product.find_or_initialize_by(
          material_code: row['material_code'],
        )
        product.name = row['name']
        product.category = row['product_category_code']
        product.status = row['status'].downcase == 'true' ? Product.statuses[:available] : Product.statuses[:unavailable]
        product.save
      end
      { success: 'CSV File imported successfully' }
    else
      { error: 'Please upload a valid file with .csv extension'}
    end
  end

end
