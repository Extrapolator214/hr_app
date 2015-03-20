# == Schema Information
#
# Table name: applicants
#
#  id              :integer          not null, primary key
#  full_name       :string           not null
#  contact_info    :string           not null
#  status          :integer          not null
#  expected_salary :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Applicant, type: :model do
  context "Full Name" do
    it "passes validation if it contains 3 words consisting of Cyrillic letters and spaces" do
      expect(Applicant.new(:name => "Иванов Иван Иванович")).to have(:no).errors_on(:name)
    end
  end
end
