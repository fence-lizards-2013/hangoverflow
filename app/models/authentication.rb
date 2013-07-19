class Authentication < ActiveRecord::Base
  attr_accessible :user_id, :provider, :uid

  belongs_to :user
  
  validates :uid, uniqueness: true
end
