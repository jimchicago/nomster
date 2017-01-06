class Image
  # belongs_to :user
  # has_many :comments
  # has_many :photos
  
  # geocoded_by :address
  # after_validation :geocode
  
  # validates :name, :presence => true, :length => { minimum: 6 }
  # validates :address, presence: true
  # validates :description, presence: true

  def initialize(image)
    @image = image  # Stores 'image' for later use, makes @image part of each instance of Image
  end

  def output_image  # No need for (argument) at end of method name
    @image.each do |row|
      puts row.join(" ")
    end
  end

end

image = Image.new([
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
    ])
image.output_image