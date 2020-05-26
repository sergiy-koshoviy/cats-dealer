class CatsController < ApplicationController
  def index
    response = RestClient.get('https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json')
    result = JSON.parse(response.body)

    @cats_list = result.select do |list|
      list['location'] == params[:user_location] && list['name'] == params[:cats_type]
    end
  end
end
