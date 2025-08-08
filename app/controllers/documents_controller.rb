class DocumentsController < ApplicationController
  before_action :set_document, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ new create edit update destroy ]

  # GET /documents or /documents.json
  def index
    @documents = Document.recent
  end

  # GET /documents/1 or /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents or /documents.json
  def create
    @document = Document.new(document_params)
    @document.uploaded_by = current_user.fullname if current_user

    if @document.save
      redirect_to @document, notice: "Document was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /documents/1 or /documents/1.json
  def update
    if @document.update(document_params)
      redirect_to @document, notice: "Document was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /documents/1 or /documents/1.json
  def destroy
    @document.destroy
    redirect_to documents_path, notice: "Document was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:title, :description, :uploaded_by, :file_url)
    end
end
