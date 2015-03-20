# == Schema Information
#
# Table name: vacancies
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  valid_to     :datetime         not null
#  salary       :integer
#  contact_info :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
