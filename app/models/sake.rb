class Sake < ApplicationRecord

    belongs_to :user
    attachment :image
    has_many :sake_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    validates :title, presence: true
    validates :body, presence: true, length: {maximum: 200}
    
   
end
