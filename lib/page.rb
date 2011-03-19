class Page
  def initialize(page_params)
    @view = page_params[:view]
  end
  def view
    @view
  end
end