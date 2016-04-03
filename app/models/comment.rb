class Comment < ActiveRecord::Base
  belongs_to :article #pertenecer a un artículo
end
