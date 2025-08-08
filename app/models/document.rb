class Document < ApplicationRecord
  validates :title, presence: true
  validates :uploaded_by, presence: true
  validates :file_url, presence: true, format: { with: URI::regexp, message: "must be a valid URL" }
  
  scope :recent, -> { order(created_at: :desc) }
  
  def file_extension
    File.extname(file_url).downcase if file_url.present?
  end
  
  def file_type
    case file_extension
    when '.pdf'
      'PDF Document'
    when '.doc', '.docx'
      'Word Document'
    when '.xls', '.xlsx'
      'Excel Spreadsheet'
    when '.ppt', '.pptx'
      'PowerPoint Presentation'
    when '.txt'
      'Text File'
    else
      'Document'
    end
  end
end
