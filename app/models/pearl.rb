class Pearl < ActiveRecord::Base

  belongs_to :river

  default_scope order('published_at desc')
  
end
