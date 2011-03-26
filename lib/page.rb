class Page
  def initialize(page_params)
    @view = page_params[:view]
    @errors = page_params[:errors] || {}
  end

  def view
    @view
  end

  def has_errors?
    @errors.size > 0
  end

  def has_error?(field_name)
    @errors.has_key?(field_name)
  end
end

class ShareNeedPage < Page
  @need
  def succeeded? 
    (@need != nil) && !has_errors?
  end 
  
  def need=(n)
    @need = n
  end
  def need
    @need
  end

end