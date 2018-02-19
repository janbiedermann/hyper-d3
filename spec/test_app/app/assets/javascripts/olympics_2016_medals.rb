require "react/test/utils" # just for mounting manually here, please ignore
require "data/olympics_2016_medals"

class OlympicsMedalsComponent
  include Hyperloop::D3::Mixin

  render_with_selection do |selection, medals2016_data|
    height = medals2016_data.size * 24
    svg = selection
            .attr("height", "#{height}px")
            .attr("width", "100%")

    width = svg.style("width").to_i
    max_medals = medals2016_data.map(&:total).max

    x = D3.scale_linear.domain([0, max_medals]).range([0, width-50])
    y = D3.scale_linear.domain([0, medals2016_data.size]).range([0, height])

    svg.append("g").attr("transform", "translate(50, 0)")
      .select_all("rect")
      .data(medals2016_data)
      .enter.append("rect")
        .attr("height", 20)
        .attr("width"){|d| x.(d.gold)}
        .attr("x", 0)
        .attr("y"){|d,i| y.(i)}
        .attr("fill", "gold")

    svg.append("g").attr("transform", "translate(50, 0)")
      .select_all("rect")
      .data(medals2016_data)
      .enter.append("rect")
        .attr("height", 20)
        .attr("width"){|d| x.(d.silver)}
        .attr("x"){|d| x.(d.gold) }
        .attr("y"){|d,i| y.(i)}
        .attr("fill", "silver")

    svg.append("g").attr("transform", "translate(50, 0)")
      .select_all("rect")
      .data(medals2016_data)
      .enter.append("rect")
        .attr("height", 20)
        .attr("width"){|d| x.(d.bronze)}
        .attr("x"){|d| x.(d.gold + d.silver) }
        .attr("y"){|d,i| y.(i)}
        .attr("fill", "#CD7F32")

    svg.append("g")
      .select_all("text")
      .data(medals2016_data)
      .enter.append("text")
        .attr("x", 0)
        .attr("y"){|d,i| y.(i) + 16}
        .text{|d| d.acronym}
        .style("font-size", "20px")
  end
end

# manual mount of component, usually you would use the react_component view helper for example
React.render(React.create_element(OlympicsMedalsComponent, data: Olympics2016Medals), `document.body.querySelector("#visualization")`)

