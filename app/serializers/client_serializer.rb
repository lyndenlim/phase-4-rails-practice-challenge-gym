class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :membership_charge_total
  
  def membership_charge_total
    self.object.memberships.sum(:charge)
  end
end
