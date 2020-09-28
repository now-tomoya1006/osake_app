class Favorite < ApplicationRecord
    class Favorite < ApplicationRecord
 belongs_to :user
 belongs_to :sake

   validates_uniqueness_of :sake_id, scope: :user_id
end

end
