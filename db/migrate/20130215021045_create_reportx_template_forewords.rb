class CreateReportxTemplateForewords < ActiveRecord::Migration
  def change
    create_table :reportx_template_forewords do |t|
      t.integer :report_template_id
      t.string :section_num
      t.integer :last_updated_by_id
      t.text :content

      t.timestamps
    end
  end
end
