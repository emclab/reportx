class AddChapterNumToReportxTemplateContents < ActiveRecord::Migration
  def change
    add_column :reportx_template_contents, :chapter_num, :integer
  end
end
