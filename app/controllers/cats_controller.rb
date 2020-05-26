class CatsController < ApplicationController
  layout false

  def index
    response = RestClient.get('https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json')
    result = JSON.parse(response.body)

    cats = result.select do |list|
      list['location'] == params[:user_location] && list['name'] == params[:cats_type]
    end
    lower_price = cats.sort_by { |list| list[:price] }.first['price'] if cats.present?

    respond_to do |format|
      format.json do
        if cats.present?
          render json: {
            html_data: render_to_string(partial: 'cats/cats', locals: {cats: cats, lower_price: lower_price})
          }
        else
          render json: {
            html_data: I18n.t('no_result')
          }
        end
      end
    end
  end
end
