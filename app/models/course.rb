class Course < ActiveRecord::Base
    has_and_belongs_to_many :students
    validates :number,  presence: true, length: { maximum: 50 }
    validates :title,  presence: true, length: { maximum: 50 }
    validates :description,  presence: true
    validates :instructor,  presence: true, length: { maximum: 50 }
    validates :start_date,  presence: true
    validates :end_date,  presence: true
    validates :status,  presence: true
    
    def self.search(query1, query2)
        #where(:title, query) -> This would return an exact match of the query
        # return scoped unless query1
        where("title like ? AND number like?", "%#{query1}%" , "%#{query2}%" ) 
    end

end

