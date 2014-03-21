class Item < ActiveRecord::Base
  belongs_to :category
  has_many :comments

  def self.do_search(title=nil, cat=nil, all_any=nil, match_no=nil)
    self.all
  end
end
