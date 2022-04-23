class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  validates :name, presence:true
  validates :summary, presence:true
  validates :price_non_tax, presence:true
  validates :image, presence:true

  has_one_attached:image

  enum is_active: { 販売中: true, 販売停止中: false }

  def get_image(width, height)
    unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.png')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def with_tax_price
    (price_non_tax * 1.1).floor
  end

  #國原定義
  def get_item_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def self.search_item_fnc(item_name)
    search_result = Item.where('name LIKE ?', "%#{item_name}%")
    return search_result
  end

end
