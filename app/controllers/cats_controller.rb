class CatsController < ApplicationController
  layout false

  def index
    search_cats

    respond_to do |format|
      format.json do
        if search_cats.ok?
          render json: {html_data: search_response}
        else
          render json: {html_data: I18n.t('something_wrong')}
        end
      end
    end
  end

  private

  def search_cats
    @search_cats ||= ::CatsService.search(cats_params)
  end

  def cats
    search_cats.result[:cats]
  end

  def lower_price
    search_cats.result[:lower_price]
  end

  def cats_params
    params.require(:cats).permit(:cats_breed, :location)
  end

  def search_response
    return I18n.t('no_result') if cats.blank?

    render_to_string(partial: 'cats/cats', locals: {cats: cats, lower_price: lower_price})
  end
end
