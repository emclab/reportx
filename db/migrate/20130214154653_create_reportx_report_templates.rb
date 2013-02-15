class CreateReportxReportTemplates < ActiveRecord::Migration
  def change
    create_table :reportx_report_templates do |t|
      t.string :name
      t.text :description
      t.integer :report_type_id
      t.integer :last_updated_by_id
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
