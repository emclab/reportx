# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template_foreword, :class => 'Reportx::TemplateForeword' do
    report_template_id 1
    section_num "1.2"
    last_updated_by_id 1
    content "template foreward"
    subject "something foreword"
  end
end
