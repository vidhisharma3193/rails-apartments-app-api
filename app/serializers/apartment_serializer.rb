class ApartmentSerializer < ActiveModel::Serializer
  attributes :id, :number, :rent_total

  # has_many :tenants

  def rent_total
    # byebug
    self.object.leases.sum(:rent)
  end
  
end
