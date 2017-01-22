class Bill < ActiveRecord::Base
  def self.showbills
    response = Typhoeus.get(
      "https://api.propublica.org/congress/v1/115/senate/bills/introduced.json",
      headers: { 'X-API-Key' => "7dwgrzlg3i2NENHUYdHRNpmki65o1f86gKLVcz75" }
    )
    
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
    response = Typhoeus.get(
      "https://api.propublica.org/congress/v1/115/house/bills/introduced.json",
      headers: { 'X-API-Key' => "7dwgrzlg3i2NENHUYdHRNpmki65o1f86gKLVcz75" }
    )

    passed_bill_data = JSON.parse(response.body)

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
