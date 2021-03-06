require 'rails_helper'

RSpec.describe DishesController, type: :controller do

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
  end

  describe '#index' do
    context 'Listing of dishes' do
      let!(:dishes) { FactoryGirl.create_list(:dish, 2) }    

      it 'should have a list of dishes' do
        get :index
        expect(assigns(:dishes).length).to eq 2
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
  
  describe '#new' do
    it 'should instantiate a dish for view' do
      setup
      get :new
      expect(assigns(:dish)).to be_a Dish
    end
  end

  describe  '#create' do 
    context "with valid attributes" do
      it "creates a new dish" do
        setup
        expect{
          post :create, dish: FactoryGirl.attributes_for(:dish)
        }.to change(Dish, :count).by(1)
      end

      it "redirects to the new dish" do
        setup
        post :create, dish: FactoryGirl.attributes_for(:dish)
        response.should redirect_to Dish.last
      end
    end

    # context "with invalid attributes" do
    #   it "does not save the new dish" do
    #     expect{
    #       post :create, dish: FactoryGirl.attributes_for(:invalid_dish)
    #     }.to_not change(Dish, :count)
    #   end

    #   it "re-renders the new method" do
    #     post :create, dish: FactoryGirl.attributes_for(:invalid_dish)
    #     response.should render_template :new
    #   end
    # end 
  end

  describe '#edit' do
    def do_request
      get :edit, id: dish.id
    end

    let!(:dish) { FactoryGirl.create(:dish) }

    it 'should find the dish to edit' do
      setup
      do_request
      expect(assigns(:dish)).to eq dish
    end
  end

  describe '#update' do
    def do_request
      put :update, id: dish.id, dish: updated_params
    end

    let!(:dish)           { FactoryGirl.create(:dish, title: 'old food') }
    let!(:updated_params) {FactoryGirl.attributes_for(:dish, title: new_title) }

    context 'Success' do    
      let!(:new_title) { 'new food' }
      
      it 'should update the dish' do
        setup
        do_request
        expect(assigns(:dish).title).to eq new_title
      end
    end

    context 'Failure' do      
      let!(:new_title) { '' }
      
      it 'should not update the dish' do
        setup
        do_request
        expect(dish.reload.title).to eq 'old food'
      end

    end
  end

  describe '#my_dishes' do 
    context 'Listing of my dishes' do
      let!(:dishes) { FactoryGirl.create_list(:dish, 2) }    

      it 'should have a list of dishes' do
        get :index
        expect(assigns(:dishes).length).to eq 2
      end
    end
  end
  
end