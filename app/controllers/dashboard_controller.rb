class DashboardController < ApplicationController
  def show
    @breeds    = breeds
    @locations = locations

    respond_to do |format|
      format.html { render :show }
      format.json do
        render json: {
          inputs: render_to_string(
            partial: 'dashboard/inputs',
            locals: {breeds: @breeds, locations: @locations}
          ),
          message: t('select_location')
        }
      end
    end
  end

  private

  def cats
    @cats ||= CatsService.all
  end

  def breeds
    cats.map { |cat| cat['breed'] }.uniq
  end

  def locations
    return [] if params[:breed].blank?

    cats.map { |cat| cat['location'] }.uniq
  end
end
