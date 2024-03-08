require "test_helper"

class FarmTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @farm_transaction = farm_transactions(:one)
  end

  test "should get index" do
    get farm_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_farm_transaction_url
    assert_response :success
  end

  test "should create farm_transaction" do
    assert_difference("FarmTransaction.count") do
      post farm_transactions_url, params: { farm_transaction: { amount: @farm_transaction.amount, description: @farm_transaction.description, happened_on: @farm_transaction.happened_on, item_name: @farm_transaction.item_name, transaction_type: @farm_transaction.transaction_type } }
    end

    assert_redirected_to farm_transaction_url(FarmTransaction.last)
  end

  test "should show farm_transaction" do
    get farm_transaction_url(@farm_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_farm_transaction_url(@farm_transaction)
    assert_response :success
  end

  test "should update farm_transaction" do
    patch farm_transaction_url(@farm_transaction), params: { farm_transaction: { amount: @farm_transaction.amount, description: @farm_transaction.description, happened_on: @farm_transaction.happened_on, item_name: @farm_transaction.item_name, transaction_type: @farm_transaction.transaction_type } }
    assert_redirected_to farm_transaction_url(@farm_transaction)
  end

  test "should destroy farm_transaction" do
    assert_difference("FarmTransaction.count", -1) do
      delete farm_transaction_url(@farm_transaction)
    end

    assert_redirected_to farm_transactions_url
  end
end
