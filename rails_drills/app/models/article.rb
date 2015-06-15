class Article < ActiveRecord::Base
	validates_presence_of :title, :content, presence :true
	belongs_to :user
end
