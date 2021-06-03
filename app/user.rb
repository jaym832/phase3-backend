class User <ActiveRecord::Base
    has_many :meals
    User.joins("INNER JOIN meals ON meal.user_id=users.id")
end