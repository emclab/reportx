# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template_content, :class => 'Reportx::TemplateContent' do
    report_template_id 1
    section_num "1.1"
    subject "MyString"
    introduction "MyText"
    content "template content"
    last_updated_by_id 1
    chapter_num 1
  end
end
