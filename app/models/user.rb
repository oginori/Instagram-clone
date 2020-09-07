class User < ApplicationRecord
  has_many :pictures
  before_validation [ email.downcase! ]
end
