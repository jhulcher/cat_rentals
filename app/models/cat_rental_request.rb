class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"] }

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: cat_id)
      .where(<<-SQL, start_date: start_date, end_date: end_date, id: self.id || 0)
        ((start_date BETWEEN :start_date AND :end_date) OR
        (end_date BETWEEN :start_date AND :end_date)) AND
        id != :id
      SQL
  end
end
