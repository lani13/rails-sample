class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def ckeditor_pictures_scope(options = { assetable_id: params[:assetable_id], assetable_type: params[:assetable_type] })
    ckeditor_filebrowser_scope(options)
  end

  #def ckeditor_attachment_files_scope(options = { assetable_id: params[:assetable_id], assetable_type: params[:assetable_type] })
  #  ckeditor_filebrowser_scope(options)
  #end


  def ckeditor_before_create_asset(asset)
    assetable_object = params[:assetable_type].constantize.find(params[:assetable_id])
    asset.assetable = assetable_object if assetable_object
    true
  end
end
