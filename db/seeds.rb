# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
response = Typhoeus.get(
      'https://www.govtrack.us/api/v2/role?current=true&limit=600')
    # get a response
    # parse the data and name it
    sen_data = JSON.parse(response.body)
    # create a new array of Senators that are ONLY Senators
    sens = sen_data["objects"].select{ |x| x["title_long"] =~ /[sS]enator/}
    # run a create method to push to the database
    sens.each do |senator|
        Senator.create({
            first_name: senator["person"]["firstname"], 
            last_name: senator["person"]["lastname"], 
            date_of_birth: senator["person"]["birthday"], 
            gender: senator["person"]["gender_label"],
            political_party: senator["party"],
            job_title: senator["description"],
            state: senator["state"],
            rank: senator["senator_rank_label"],
            phone: senator["phone"],
            start_date: senator["startdate"],
            end_date: senator["enddate"],
            website: senator["website"],
            link_to_gov: senator["person"]["link"],
            twitter_handle: senator["person"]["twitterid"],
            youtube_id: senator["person"]["youtubeid"],
            cspan_id: senator["person"]["cspanid"],
            pvsid: senator["person"]["pvsid"],
            osid: senator["person"]["osid"],
            bioguideid: senator["person"]["bioguideid"]})
    end

    hash_state = {
      "AL"  =>  "Alabama",
      "AK"  =>  "Alaska",
      "AZ"  =>  "Arizona",
      "AR"  =>  "Arkansas",
      "CA"  =>  "California",
      "CO"  =>  "Colorado",
      "CT"  =>  "Connecticut",
      "DE"  =>  "Delaware",
      "FL"  =>  "Florida",
      "GA"  =>  "Georgia",
      "HI"  =>  "Hawaii",
      "ID"  =>  "Idaho",
      "IL"  =>  "Illinois",
      "IN"  =>  "Indiana",
      "IA"  =>  "Iowa",
      "KS"  =>  "Kansas",
      "KY"  =>  "Kentucky",
      "LA"  =>  "Louisiana",
      "ME"  =>  "Maine",
      "MD"  =>  "Maryland",
      "MA"  =>  "Massachusetts",
      "MI"  =>  "Michigan",
      "MN"  =>  "Minnesota",
      "MS"  =>  "Mississippi",
      "MO"  =>  "Missouri",
      "MT"  =>  "Montana",
      "NE"  =>  "Nebraska",
      "NV"  =>  "Nevada",
      "NH"  =>  "New%20Hampshire",
      "NJ"  =>  "New%20Jersey",
      "NM"  =>  "New%20Mexico",
      "NY"  =>  "New%20York",
      "NC"  =>  "North%20Carolina",
      "ND"  =>  "North%20Dakota",
      "OH"  =>  "Ohio",
      "OK"  =>  "Oklahoma",
      "OR"  =>  "Oregon",
      "PA"  =>  "Pennsylvania",
      "RI"  =>  "Rhode%20Island",
      "SC"  =>  "South%20Carolina",
      "SD"  =>  "South%20Dakota",
      "TN"  =>  "Tennessee",
      "TX"  =>  "Texas",
      "UT"  =>  "Utah",
      "VT"  =>  "Vermont",
      "VA"  =>  "Virginia",
      "WA"  =>  "Washington",
      "WV"  =>  "West%20Virginia",
      "WI"  =>  "Wisconsin",
      "WY"  =>  "Wyoming" 
    }

    Senator.all.each do |senator|
        sen_state = hash_state[senator[:state]]
        senator[:full_state_name] = sen_state
        p senator
        senator.save!
    end