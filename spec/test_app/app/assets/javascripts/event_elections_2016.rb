require "react/test/utils" # just for mounting manually here, please ignore
require "data/elections_2016"

class ElectionComponent
  include Hyperloop::D3::Mixin

  render_with_selection('DIV') do |selection, election_data|
    if selection.select("ul").empty?
      list = selection.append("ul")
    else
      selection.select("ul").remove
      list = selection.append("ul")
    end
    max_votes = election_data.map(&:votes).max

    election_data.each do |candidate|
      item = list.append("li")
        .style("position", "relative")
      item.append("span")
        .style("background-color", candidate.color)
        .style("position", "absolute")
        .style("width", "#{100.0 * candidate.votes / max_votes}%")
        .style("height", "100%")
      item.append("span")
        .style("position", "absolute")
        .text("#{candidate.name} - #{candidate.votes} votes")
    end
  end
end

class OuterComponent
  include Hyperloop::Component::Mixin

  before_mount do
    mutate.election_data Elections2016
  end

  render('DIV') do
    ElectionComponent(data: state.election_data)
    BUTTON { "Add Arnold" }.on(:click) do
      arnold = { name: "Arnold Schwarzenegger", votes: 145655864, color: "#FFAdA6" }
      Elections2016 << arnold unless Elections2016.include? arnold
      mutate.election_data(Elections2016.map{|o| OpenStruct.new(o)})
    end
  end
end
# manual mount of component, usually you would use the react_component view helper for example
React.render(React.create_element(OuterComponent), `document.body.querySelector("#visualization")`)
