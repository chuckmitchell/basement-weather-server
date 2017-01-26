require 'test_helper'

class SpecificGravitiesControllerTest < ActionController::TestCase
  setup do
    @specific_gravity = specific_gravities(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:specific_gravities)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create specific_gravity' do
    assert_difference('SpecificGravity.count') do
      post :create, specific_gravity: { batch_id: @specific_gravity.batch_id, type: @specific_gravity.type, value: @specific_gravity.value }
    end

    assert_redirected_to specific_gravity_path(assigns(:specific_gravity))
  end

  test 'should show specific_gravity' do
    get :show, id: @specific_gravity
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @specific_gravity
    assert_response :success
  end

  test 'should update specific_gravity' do
    patch :update, id: @specific_gravity, specific_gravity: { batch_id: @specific_gravity.batch_id, type: @specific_gravity.type, value: @specific_gravity.value }
    assert_redirected_to specific_gravity_path(assigns(:specific_gravity))
  end

  test 'should destroy specific_gravity' do
    assert_difference('SpecificGravity.count', -1) do
      delete :destroy, id: @specific_gravity
    end

    assert_redirected_to specific_gravities_path
  end
end
