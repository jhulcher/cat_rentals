class Cat < ActiveRecord::Base
  CAT_COLORS = ['black', 'white', 'calico', 'grey', 'beige']
  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: { in: CAT_COLORS }
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: ['M', 'F'] }
end
