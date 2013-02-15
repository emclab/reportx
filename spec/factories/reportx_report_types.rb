# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report_type, :class => 'Reportx::ReportType' do
    name "for air"
    last_updated_by_id 1
    brief_note "air inspection"
    active true
  end
end
