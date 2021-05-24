require 'open-uri'
require 'nokogiri'


def seed_team(path, team_id)
  url = "https://fbref.com/en/squads/#{path}"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)
  player_names = []
  player_positions = []
  player_table = html_doc.search('#all_stats_standard')

  # Get Player Names
  player_table.css('th.left').each do |element|
    player_name_xml = element.attribute('data-append-csv')
    if player_name_xml.class != NilClass
      player_names << player_name_xml.inner_html
      # Player.create(name: player_name, club_id: team_id) unless player_name.nil?
    end
  end

  # Get Player Positions
  i = 0
  player_table.css("tr").each do |element|
    if element.css("td[data-stat=position]").inner_text != ""
      player_positions << element.css("td[data-stat=position]").inner_text
      i += 1
    end
  end

  n = 0
  player_names.each do |name|
    Player.create(name: name, club_id: team_id, position: player_positions[n])
    n += 1
  end

end

Club.create(name:"Manchester City")
Club.create(name:"Manchester United")
Club.create(name:"Chelsea")
Club.create(name:"Liverpool")
Club.create(name:"Leicester City")
Club.create(name:"West Ham United")
Club.create(name:"Tottenham")

seed_team('b8fd03ef/Manchester-City-Stats', Club.find_by(name: "Manchester City").id)
seed_team('19538871/Manchester-United-Stats', Club.find_by(name: "Manchester United").id)
seed_team('cff3d9bb/Chelsea-Stats', Club.find_by(name: "Chelsea").id)
seed_team('822bd0ba/Liverpool-Stats', Club.find_by(name: "Liverpool").id)
seed_team('a2d435b3/Leicester-City-Stats', Club.find_by(name: "Leicester City").id)
seed_team('7c21e445/West-Ham-United-Stats', Club.find_by(name: "West Ham United").id)
seed_team('361ca564/Tottenham-Hotspur-Stats', Club.find_by(name: "Tottenham").id)
# seed_team('d3fd31cc/Everton-Stats', 9)
# seed_team('18bb7c10/Arsenal-Stats', 10)
# seed_team('5bfb9659/Leeds-United-Stats', 11)
# seed_team('8602292d/Aston-Villa-Stats', 12)
# seed_team('8cec06e1/Wolverhampton-Wanderers-Stats', 13)
# seed_team('47c64c55/Crystal-Palace-Stats', 14)
# seed_team('33c895d4/Southampton-Stats', 15)
# seed_team('b2b47a98/Newcastle-United-Stats', 16)
# seed_team('d07537b9/Brighton-and-Hove-Albion-Stats', 17)
# seed_team('943e8050/Burnley-Stats', 18)
# seed_team('fd962109/Fulham-Stats', 19)
# seed_team('60c6b05f/West-Bromwich-Albion-Stats', 20)
# seed_team('1df6b87e/Sheffield-United-Stats', 21)
