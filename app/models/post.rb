class Post < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :answers, dependent: :destroy
end
