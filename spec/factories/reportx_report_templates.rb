# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report_template, :class => 'Reportx::ReportTemplate' do
    name "water report"
    description "for water related report"
    report_type_id 1
    last_updated_by_id 1
    active true
  end
end
