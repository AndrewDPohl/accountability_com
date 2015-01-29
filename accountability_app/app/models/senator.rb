class Senator < ActiveRecord::Base
  belongs_to :watchlists
  
  def showvotes
    response = Typhoeus.get(ENV['NYT_voter_data1'] + self[:bioguideid] + ENV['NYT_voter_data2'])

    voter_data = JSON.parse(response.body)

    votes = voter_data["results"]

    votes.map do |votes|
      {
        most_recent_vote: votes["most_recent_vote"],
        bills_sponsored: votes["roles"][0]["bills_sponsored"],
        bills_cosponsored: votes["roles"][0]["bills_cosponsored"],
        missed_votes_pct: votes["roles"][0]["missed_votes_pct"],
        votes_with_party_pct: votes["roles"][0]["votes_with_party_pct"]
      }
    end
  end

  def showpics
    senpics = "http://theunitedstates.io/images/congress/450x550/#{bioguideid}.jpg"
  end

  def showflag
    senflag = "http://www.50states.com/images/redesign/flags/#{state}-smallflag.png"
  end

  def showstate
    senstate = "https://raw.githubusercontent.com/TheJasonHorsley/state-map/master/stateImages/California.png"
  end




end
