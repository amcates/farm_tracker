require "application_system_test_case"

class FarmTransactionsTest < ApplicationSystemTestCase
  setup do
    @farm_transaction = farm_transactions(:one)
  end

  test "visiting the index" do
    visit farm_transactions_url
    assert_selector "h1", text: "Farm transactions"
  end

  test "should create farm transaction" do
    visit farm_transactions_url
    click_on "New farm transaction"

    fill_in "Amount", with: @farm_transaction.amount
    fill_in "Description", with: @farm_transaction.description
    fill_in "Happened on", with: @farm_transaction.happened_on
    fill_in "Item name", with: @farm_transaction.item_name
    fill_in "Transaction type", with: @farm_transaction.transaction_type
    click_on "Create Farm transaction"

    assert_text "Farm transaction was successfully created"
    click_on "Back"
  end

  test "should update Farm transaction" do
    visit farm_transaction_url(@farm_transaction)
    click_on "Edit this farm transaction", match: :first

    fill_in "Amount", with: @farm_transaction.amount
    fill_in "Description", with: @farm_transaction.description
    fill_in "Happened on", with: @farm_transaction.happened_on
    fill_in "Item name", with: @farm_transaction.item_name
    fill_in "Transaction type", with: @farm_transaction.transaction_type
    click_on "Update Farm transaction"

    assert_text "Farm transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Farm transaction" do
    visit farm_transaction_url(@farm_transaction)
    click_on "Destroy this farm transaction", match: :first

    assert_text "Farm transaction was successfully destroyed"
  end
end
