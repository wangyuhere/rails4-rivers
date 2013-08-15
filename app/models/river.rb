class River < ActiveRecord::Base

  has_many :pearls

  # add pearl from item to river
  # if item already saved, fetch and return pearl directly
  def add_pearl_from_item(item)
    params = item.clone
    params[:item_id] = item[:id]
    params.delete :id
    pearls.where(item_id: item[:id], type_of_media: item[:type_of_media]).first_or_create(params)
  end

end
