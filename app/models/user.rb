class User < ApplicationRecord
    has_many :products
    has_many :posts
    
    has_secure_password
    acts_as_paranoid

    validates :first_name, presence: true
    validates_format_of :first_name, :with => /\A[a-zA-ZáéíóúÁÉÍÓÚ\s]*\Z/
    validates :last_name, presence: true
    validates_format_of :last_name, :with =>/\A[a-zA-ZáéíóúÁÉÍÓÚ\s]*\Z/
    validates :password, length: {minimum: 6, maximum: 20}, presence: true
    validates :email, presence: true, email: true, uniqueness: true
    validates :phone, presence:true

end
