class User < ActiveRecord::Base
 has_secure_password
 has_many :questions
 has_many :answers
 has_many :responses
 has_many :votes, foreign_key: :voter_id

 validates :name, presence: true, uniqueness: true
 validates :password, presence: true, confirmation: true, length: { minimum: 6 }
 validates :password_confirmation, presence: true

 def error_string
  self.errors.full_messages.join(",\n")
 end
end