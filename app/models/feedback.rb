class Feedback < ApplicationRecord
    validates :title, presence: true, length: {minimum: 6, maximum: 30}
    validates :body, presence: true, length: {minimum: 50, maximum: 250}
end
