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
    it "fails validation with no name" do
      expect(Applicant.new).to have(1).error_on(:full_name)
    end

    it "fails validation with no name expecting a specific message" do
      expect(Applicant.new.errors_on(:full_name)).to include("can't be blank")
    end

    it "fails validation with a 2 words name" do
      expect(Applicant.new(:full_name => "Иванов Иван")).to have(1).errors_on(:full_name)
    end

    it "fails validation with a 4 words name" do
      expect(Applicant.new(:full_name => "Иванов Иван Иванович Иванов")).to have(1).errors_on(:full_name)
    end

    it "fails validation with non Cyrillic letters" do
      expect(Applicant.new(:full_name => "Ivanov Ivan Ivanovich")).to have(1).errors_on(:full_name)
    end

    it "fails validation with a special characters" do
      expect(Applicant.new(:full_name => "Иванов Иван (Иванович)")).to have(1).errors_on(:full_name)
    end

    it "passes validation if it contains 3 words consisting of Cyrillic letters and spaces" do
      expect(Applicant.new(:full_name => "Иванов Иван Иванович")).to have(:no).errors_on(:full_name)
    end

    it "passes validation if it contains 3 words consisting of Cyrillic letters and multiple spaces" do
      expect(Applicant.new(:full_name => " Иванов   Иван  Иванович ")).to have(:no).errors_on(:full_name)
    end
  end
end
