class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  @@visualizations = {
    event_elections_2016: "Elections 2016 with Event Handler",
    elections_2016: "Elections 2016",
    london_population: "London Population",
    london_population_area: "London Population - Area Chart",
    olympics_2016_medals: "Olympics 2016 Medals",
    iphones: "iPhones",
    polish_pms: "Polish Prime Ministers",
    man_vs_horse: "Man versus Horse Marathon",
    paradox: "Paradox Interactive Games",
    weather_in_london: "Weather in London",
    harry_potter: "Harry Potter Books",
    mtg_modern_creatures: "MTG: Creatures in Modern",
    mtg_modern_colors: "MTG: Spell Cards in Modern",
    star_trek_voyager: "Star Trek: Voyager",
  }

  def index
    @visualizations = @@visualizations
  end

  def visualization
    @visualizations = @@visualizations
  end
end
