class Student < User
<<<<<<< HEAD
    has_and_belongs_to_many :courses

=======
    has_many :grades
    has_many :courses
>>>>>>> a10f98fb6359441795f17285368d209ad92fbd76
end