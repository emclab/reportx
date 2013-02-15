class CreateReportxTemplateAppendixes < ActiveRecord::Migration
  def change
    create_table :reportx_template_appendixes do |t|
      t.string :section_num
      t.integer :last_updated_by_id
      t.integer :report_template_id
      t.text :content

      t.timestamps
    end
  end
end
