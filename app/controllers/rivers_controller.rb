class RiversController < ApplicationController
  def index
    @rivers = River.all
  end

  def show
    @river = River.find params[:id]
  end

  # fetch recently added pearls after the last_pearl_id
  # and return rendered pearls html as json
  def fetch
    river = River.find_by id: params[:id]
    error = nil
    if river.nil?
      error = 'river does not exist'
    else
      last_pearl = Pearl.find_by id: params[:last_pearl_id]
      if last_pearl.nil?
        error = 'last_pearl_id does not exist'
      else
        @pearls = river.pearls.where('published_at >= ? and id > ?', last_pearl.published_at, last_pearl.id)
      end
    end

    json_result = {}
    if error.nil?
      json_result[:pearls] = @pearls.map do |p|
        { html: render_to_string(partial: 'pearl', locals: { pearl: p } ) }
      end
    else
      json_result[:error] = error
    end
    
    render json: json_result
  end
end
