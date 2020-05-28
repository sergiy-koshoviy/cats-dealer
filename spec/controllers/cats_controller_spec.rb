require 'rails_helper'

describe CatsController do
  describe 'GET #index' do
    context 'when params are not correct' do
      it 'raise error - parameter missing' do
        expect { get :index }.to raise_error ActionController::ParameterMissing
      end
    end

    context 'when format is not correct' do
      let(:params) { {cats: {cats_breed: 'missing', location: 'missing'}} }

      it 'raise error - unknown format' do
        expect { get :index, params: params }.to raise_error ActionController::UnknownFormat
      end
    end

    context 'when cats did\'t find' do
      let(:params) { {cats: {cats_breed: 'missing', location: 'missing'}} }
      let(:permitted_params) { ActionController::Parameters.new(params[:cats]).permit! }
      let(:cats_service_obj) { double('CatsService', result: {}, ok?: true) }

      before do
        allow(CatsService).to receive(:search).with(permitted_params).and_return(cats_service_obj)
        get 'index', params: params, format: :json
      end

      it 'returns status OK' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns "no cats" message' do
        expect(response.body).to include('Sorry, no cats for your location ;(')
      end
    end

    context 'when returns sommething wrong' do
      let(:params) { {cats: {cats_breed: 'missing', location: 'missing'}} }
      let(:permitted_params) { ActionController::Parameters.new(params[:cats]).permit! }
      let(:cats_service_obj) { double('CatsService', result: {}, ok?: false, errors: ['Blablabla']) }

      before do
        allow(CatsService).to receive(:search).with(permitted_params).and_return(cats_service_obj)
        get 'index', params: params, format: :json
      end

      it 'returns message' do
        expect(response.body).to include('Ooooops')
      end
    end

    context 'when cats found' do
      let(:params) { {cats: {cats_breed: 'missing', location: 'missing'}} }
      let(:permitted_params) { ActionController::Parameters.new(params[:cats]).permit! }
      let(:cats_collection) do
        [
          {'name' => 'missing', 'location' => 'missing', 'price' => '100', 'image' => 'image.jpg'}
        ]
      end
      let(:searched_cats) { {cats: cats_collection, lower_price: '100'} }
      let(:cats_service_obj) { double('CatsService', result: searched_cats, ok?: true) }

      before do
        allow(CatsService).to receive(:search).with(permitted_params).and_return(cats_service_obj)
        get 'index', params: params, format: :json
      end

      it 'returns message' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
