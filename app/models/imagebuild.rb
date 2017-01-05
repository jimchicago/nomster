class Image < ActiveRecord::Base
  # belongs_to :user
  # has_many :comments
  # has_many :photos
  
  # geocoded_by :address
  # after_validation :geocode
  
  # validates :name, :presence => true, :length => { minimum: 6 }
  # validates :address, presence: true
  # validates :description, presence: true

  def initialize
    @image = Image.new([
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
    ])

   def output_image(image)
    @image.each do |row|
      puts row.join(" ")  
  end

  image.output_image

end