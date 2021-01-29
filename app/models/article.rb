class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :destroy
    has_one :picture, as: :imageable

    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 5}
    accepts_nested_attributes_for :picture

    def have_picture?
        return self.picture && self.picture.image.attached?
    end

    def archived?
        status == 'archived'
    end
end
