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

    context 'ransack search fuzzy by title or description' do

      let!(:dish1) { FactoryGirl.create(:dish, title: 'Frozen banana', description: 'This freeze-ahead dinner party dessert') }
      let!(:dish2) { FactoryGirl.create(:dish, title: 'Beef Wellington', description: 'a show-stopping centrepiece on a special occasion') }

      context 'finds title or description' do
        before { get :index, q: {title_or_description_cont: 'Frozen'} }

        it "should find title or description" do
          expect(assigns(:dishes).first).to eq dish1
        end

        it { should respond_with(:success) }
        it { should render_template(:index) }
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