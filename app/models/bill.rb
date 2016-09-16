class Bill < ActiveRecord::Base
  def self.showbills
    response = Typhoeus.get(ENV['NYT_bills_url'])
    bill_data = JSON.parse(response.body)

    bills = bill_data["results"][0]["bills"]


    bills.map do |bills|
      {
        title: bills["title"],
        number: bills["number"],
        introduced_date: bills["introduced_date"],
        committees:bills["committees"],
        latest_major_action_date:bills["latest_major_action_date"],
        latest_major_action:bills["latest_major_action"]
      }
    end
  end  

  def self.passed_bills
    response1 = Typhoeus.get(ENV['PASSED_BILLS']) 
    passed_bill_data = JSON.parse(response1.body)

    passed_bills = passed_bill_data["results"][0]["bills"]

    passed_bills.map do |passed_bills|
      {
        title: passed_bills["title"],
        number: passed_bills["number"],
        introduced_date: passed_bills["introduced_date"],
        latest_major_action_date: passed_bills["latest_major_action_date"],
        latest_major_action: passed_bills["latest_major_action"]
      }
    end
  end


end
