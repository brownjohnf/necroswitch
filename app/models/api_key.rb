class ApiKey < ApplicationRecord
  validates :key,
    presence: true

  has_many :switches,
    dependent: :destroy,
    inverse_of: :api_key

  before_validation do
    self.key ||= SecureRandom.uuid
  end
end

