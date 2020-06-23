require "utils/date_utils"

class BabySerializer < ActiveModel::Serializer
  attributes :id, :name, :birthday, :months_age, :mother_name, :father_name, :phone, :address

  def months_age
    DateUtils.distance_in_months(object.birthday, Date.today)
  end
end
