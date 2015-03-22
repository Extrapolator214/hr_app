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

    it "strips extra spaces from name" do
      expect(Applicant.new(:full_name => " Иванов   Иван  Иванович ").strip_spaces_from_name).to eq "Иванов Иван Иванович"
    end
  end

  context "Contact Info" do
    it "fails validation with no value" do
      expect(Applicant.new).to have(1).error_on(:contact_info)
    end

    it "fails validation with a random value" do
      expect(Applicant.new(:contact_info => "some_value 12# 1222-0")).to have(1).errors_on(:contact_info)
    end

    ['81234567890', '8-123-456-7890', '8-123-456-78-90', '+7 123 456 7890', '+7-123-456-78-90', '+7 (123) 456-78-90'].each do |phone|
      it "fails validation if it contains phone number like this: #{phone}" do
        expect(Applicant.new(:contact_info => phone)).to have(1).errors_on(:contact_info)
      end
    end

    it "passes validation if it contains phone number in international format without spaces" do
      expect(Applicant.new(:contact_info => "+71234567890")).to have(:no).errors_on(:contact_info)
    end

    ['test@test.com', 'test@fancy-domain.network', 'test.test_test.test@subdomain.subdomain.test.ru'].each do |email|
      it "passes validation if it contains email like this: #{email}" do
        expect(Applicant.new(:contact_info => email)).to have(:no).errors_on(:contact_info)
      end
    end

    it "fails validation if it contains both phone number and email" do
      expect(Applicant.new(:contact_info => "+7 123 456 7890, email@test.com")).to have(1).errors_on(:contact_info)
    end
  end

end
