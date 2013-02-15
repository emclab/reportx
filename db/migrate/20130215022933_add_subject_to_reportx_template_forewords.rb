class AddSubjectToReportxTemplateForewords < ActiveRecord::Migration
  def change
    add_column :reportx_template_forewords, :subject, :string
  end
end
