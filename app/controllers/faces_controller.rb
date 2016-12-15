class FacesController < ApplicationController
  def index
    client = Face.get_client(api_key: ENV['API_KEY'], api_secret: ENV['API_SECRET'])
    @faces = client.faces_detect(:urls => ['http://www.handsonbanking.org/financial-education/wp-content/uploads/2013/05/hero.jpg', 'http://cdn.business2community.com/wp-content/uploads/2016/02/progressive-profiling-lead-scoring-better-leads.jpg.jpg'])
    # @faces = client.faces_detect(:file => File.new('image.jpg', 'rb'))
  end
end
