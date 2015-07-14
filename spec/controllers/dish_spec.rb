require 'rails_helper'

RSpec.describe DishesController, type: :controller do
  describe '#index' do
    context 'Listing of dishes' do
      let!(:dishes) { FactoryGirl.create_list(:dish, 10) }    

      it 'should have a list of dishes' do
        get :index
        expect(assigns(:dishes).length).to eq 10
      end
    end
  end

  describe '#show' do
    let!(:dish) { FactoryGirl.create(:dish) }

    it 'should find a dish for view' do
      get :show, id: dish.id
      expect(assigns(:dish)).to eq dish
    end
  end
end