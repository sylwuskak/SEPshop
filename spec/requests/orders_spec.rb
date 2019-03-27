require "rails_helper"

describe "Orders requests", type: :request do
  describe "orders pages" do
    
    it "displays right title" do
      visit "/orders"
      expect(page).to have_selector("h2", text: "List of orders")
    end

    it "displays right title in new page" do
        visit "/orders/new"
        expect(page).to have_selector("h2", text: "New order")
    end
  end
end
