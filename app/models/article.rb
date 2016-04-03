class Article < ActiveRecord::Base
	#has_many :comments#Se encuentra en muchos comentarios:
	has_many :comments, dependent: :destroy # Elimina el articulo y los comentarios relacionados
	validates :title, presence: true,length: { minimum: 5 }
end
