class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
         
       
        
    has_many :sakes
    has_many :sake_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
      self.inheritance_column = :_type_disabled # この行を追加
     validates :name, length: {in: 2..20}
     validates :introduction, length: {maximum: 50}
     attachment :profile_image, destroy: false
  
  def email_required?
    false
  end

  def email_changed?
    false
  end

    def already_favorited?(sake)
    self.favorites.exists?(sake_id: sake.id)
  end


end

