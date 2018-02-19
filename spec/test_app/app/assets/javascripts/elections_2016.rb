require "react/test/utils" # just for mounting manually here, please ignore
require "data/elections_2016"

class ElectionComponent
  include Hyperloop::D3::Mixin

  render_with_selection('DIV') do |selection, election_data|
    list = selection.append("ul")
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

# manual mount of component, usually you would use the react_component view helper for example
React.render(React.create_element(ElectionComponent, data: Elections2016), `document.body.querySelector("#visualization")`)
