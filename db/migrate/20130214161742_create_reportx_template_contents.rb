class CreateReportxTemplateContents < ActiveRecord::Migration
  def change
    create_table :reportx_template_contents do |t|
      t.integer :report_template_id
      t.string :section_num
      t.string :subject
      t.text :introduction
      t.text :content
      t.integer :last_updated_by_id

      t.timestamps
    end
  end
end
