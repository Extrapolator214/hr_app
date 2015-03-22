json.array!(@applicants) do |applicant|
  json.extract! applicant, :id
  json.url applicant_url(applicant, format: :json)
end
