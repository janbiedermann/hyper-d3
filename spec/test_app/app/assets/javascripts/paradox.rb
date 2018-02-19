require "hyper-d3"
require "data/paradox"

class ParadoxComponent
  include Hyperloop::D3::Mixin

  render_with_selection do |selection, paradox_data|
    svg = selection
            .attr("height", "600px")
            .attr("width", "100%")
    width = svg.style("width").to_i

    min_date, max_date = paradox_data.map(&:time).minmax
    count = paradox_data.map{|g| [g.series, g.number]}.uniq.size
    bar_height = 580 / count

    x = D3.scale_linear.domain([min_date, max_date]).range([0,width-220])
    y = D3.scale_ordinal.range(count.times.map{|x| bar_height * x})
    c = D3.scale_ordinal.range(D3.scheme_category_10)
    stripes = D3.scale_ordinal.range([0,1])

    graph_area = svg.append("g")
        .attr("transform", "translate(200, 20)")

    paradox_data.each do |game|
      dlc = (game.dlc != "")
      full_game = "#{game.series} #{game.number}"

      graph_area.append("circle")
        .attr("cx", x.(game.time))
        .attr("cy", y.(full_game))
        .attr("r", dlc ? 8 : 12)
        .attr("fill", c.("#{game.series}"))
        .attr("opacity", 0.6)
        .attr("stroke-width", "1px")
        .attr("stroke", "black")

      unless dlc
        graph_area.append("text")
          .attr("x", -200 + 5)
          .attr("y", y.(full_game) + 4)
          .text(full_game)

        color = D3.color(c.("#{game.series}"))
        color = color.brighter(stripes.("#{full_game}"))
        graph_area.append("rect")
          .attr("x", -200)
          .attr("width", width)
          .attr("y", y.(full_game) - bar_height/2)
          .attr("height", bar_height)
          .attr("fill", color)
          .attr("opacity", 0.2)
      end
    end


    axis_bottom = D3.axis_bottom(x)
      .tick_format(D3.time_format("%B %Y"))
    graph_area.append("g").attr("transform", "translate(0, 560)").call(axis_bottom)
  end
end

# manual mount of component, usually you would use the react_component view helper for example
React.render(React.create_element(ParadoxComponent, data: ParadoxGames), `document.body.querySelector("#visualization")`)
