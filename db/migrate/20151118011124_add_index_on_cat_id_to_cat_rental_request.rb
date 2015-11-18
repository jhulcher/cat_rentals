class AddIndexOnCatIdToCatRentalRequest < ActiveRecord::Migration
  def change
    add_index(:cat_rental_requests, :cat_id, unique: true)
  end
end
