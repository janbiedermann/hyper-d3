require "react/test/utils" # just for mounting manually here, please ignore
require "data/star_trek_voyager"

class StarTrekVoyagerComponent < Hyperloop::D3::Component
  render_with_selection('DIV') do |selection, voyager_data|
    svg = selection.append("svg")
            .attr("height", "600px")
            .attr("width", "100%")
    width = svg.style("width").to_i

    x = D3.scale_linear.domain([0, voyager_data.size-1]).range([40, width-20])
    y = D3.scale_linear.domain(voyager_data.map(&:rating).minmax).range([550, 50])
    c = D3.scale_ordinal.range(D3.scheme_category_10)

    (1..7).each do |season|
      episodes = voyager_data.select{|episode| episode.season == season }
      avg = D3.mean(episodes.map(&:rating))
      svg.append("line")
        .attr("x1", x.(episodes.map(&:number).min))
        .attr("x2", x.(episodes.map(&:number).max))
        .attr("y1", y.(avg))
        .attr("y2", y.(avg))
        .attr("stroke", c.(season))
        .attr("stroke-width", 2)
        .attr("opacity", 0.4)
    end

    voyager_data.each do |episode|
      svg.append("circle")
        .attr("cx", x.(episode.number))
        .attr("cy", y.(episode.rating))
        .attr("r", 4)
        .attr("fill", c.(episode.season))
        .attr("opacity", 0.6)
    end

    axis = D3.axis_left(y)
    svg.append("g").attr("transform","translate(30, 0)")
      .call(axis)
  end
end

# manual mount of component, usually you would use the react_component view helper for example
React.render(React.create_element(StarTrekVoyagerComponent, data: StarTrekVoyager), `document.body.querySelector("#visualization")`)
