class MakeContentNullableInArticles < ActiveRecord::Migration[8.0]
  def change
    change_column_null :articles, :content, true
  end
end
