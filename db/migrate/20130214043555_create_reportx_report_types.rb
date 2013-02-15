class CreateReportxReportTypes < ActiveRecord::Migration
  def change
    create_table :reportx_report_types do |t|
      t.string :name
      t.integer :last_updated_by_id
      t.string :brief_note
      t.boolean :active

      t.timestamps
    end
  end
end
