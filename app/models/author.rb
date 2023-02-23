class Author < ApplicationRecord

    # All authors have a name 
    validates :name, presence: true

    # Two authors do not have the same name 
    validates :name, uniqueness: true

    # Author phone number are exactly ten digits 
    validates :phone_number, length: {is: 10}

end
