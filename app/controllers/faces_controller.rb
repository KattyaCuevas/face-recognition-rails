class FacesController < ApplicationController
  def index
    @faces = ['Ninguno']
  end

  def recognize
    uploaded_io = params[:pic]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    client = Face.get_client(api_key: ENV['API_KEY'], api_secret: ENV['API_SECRET'])
    @faces = client.faces_detect(file: File.new('public/uploads/' + uploaded_io.original_filename, 'rb'))['photos'][0]['tags'].map { |tag| tag['uids'][0]['uid'] if tag['uids'] }
    # @faces = client.faces_detect(urls:  ['http://www.handsonbanking.org/financial-education/wp-content/uploads/2013/05/hero.jpg', 'http://cdn.business2community.com/wp-content/uploads/2016/02/progressive-profiling-lead-scoring-better-leads.jpg.jpg'])
    render 'index'
  end
end
