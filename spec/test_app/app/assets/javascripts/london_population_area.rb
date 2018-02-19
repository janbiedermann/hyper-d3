require "react/test/utils" # just for mounting manually here, please ignore
require "data/london_population"

class LondonPopAreaComponent
  include Hyperloop::D3::Mixin

  render_with_selection do |selection, lp_data|
    svg = selection
            .attr("height", "500px")
            .attr("width", "100%")
    width = svg.style("width").to_i

    x = D3.scale_linear.domain([1801, 2011]).range([0, width-60])
    y = D3.scale_linear.domain([0, 9_000_000]).range([400, 0])

    greater_area = D3.area
                .x{|d| x.(d.year) }
                .y0(400)
                .y1{|d| y.(d.greater)}
                .curve(D3.curve_natural)

    inner_area = D3.area
                .x{|d| x.(d.year) }
                .y0(400)
                .y1{|d| y.(d.inner)}
                .curve(D3.curve_natural)

    graph_area = svg.append("g")
        .attr("transform", "translate(60, 20)")
    graph_area.append("path")
        .attr("d", greater_area.(lp_data))
        .attr("fill", "pink")
    graph_area.append("path")
        .attr("d", inner_area.(lp_data))
        .attr("fill", "steelblue")

    axis_bottom = D3.axis_bottom(x).tick_format(D3.format("d"))
    axis_left = D3.axis_left(y).tick_format{|d| "#{d/1_000_000}M"}
    graph_area.call(axis_left)
    graph_area.append("g").attr("transform", "translate(0, 400)").call(axis_bottom)

    list = D3.select("#visualization").append("table")
    list.append("tr").append("td").text("Outer London").style("background", "pink")
    list.append("tr").append("td").text("Inner London").style("background", "steelblue")
  end
end

# manual mount of component, usually you would use the react_component view helper for example
React.render(React.create_element(LondonPopAreaComponent, data: LondonPopulation), `document.body.querySelector("#visualization")`)
