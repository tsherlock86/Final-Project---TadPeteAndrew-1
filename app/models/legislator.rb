class Legislator < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_full_name, :against => [:firstName, :lastName]

  def full_name
    firstName + ' ' + lastName
  end

  def shortDescription(bill)
    if self.session == "2015"
      Bill.where(billName: bill).first["shortDescription"]
    else
      Bill.where(billName: bill).last["shortDescription"]
    end
  end

end
