# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template_appendix, :class => 'Reportx::TemplateAppendix' do
    section_num "2.3"
    last_updated_by_id 1
    report_template_id 1
    content "appendix content"
    subject 'Something'
  end
end
