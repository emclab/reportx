class AddSubjectToReportxTemplateAppendixes < ActiveRecord::Migration
  def change
    add_column :reportx_template_appendixes, :subject, :string
  end
end
