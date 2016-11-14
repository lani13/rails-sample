class PdfsController < ApplicationController
 layout 'pdf_layout'
  
  def new
    @user = User.find(1)
  
    respond_to do |format|
      format.html
      format.pdf do
            render pdf: "test.pdf",
                   orientation: 'Landscape',
                   layout: 'layouts/pdf_layout',
                   template: "pdfs/new",
                   page_size: 'A4',
                   save_to_file: 'cert.pdf',
                   show_as_html: params.key?('debug')
       end
    end
  end

  def download 
    html = render_to_string(action: :new, layout: "layouts/pdf_layout") 
    pdf = WickedPdf.new.pdf_from_string(html) 

    send_data(pdf, 
      filename: "certyfikat.pdf", 
      type: :pdf) 
  end

end
