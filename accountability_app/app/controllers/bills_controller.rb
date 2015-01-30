class BillsController < ApplicationController
  def index
    @bills = Bill.showbills
  end

  def passed_bills
    @passed_bills = Bill.passed_bills
  end

end
