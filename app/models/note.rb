class Note < ActiveRecord::Base
  before_save { self.name = name.downcase }
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :url, presence: true, length: { maximum: 255}
  validates(:contents, presence: true)

end
