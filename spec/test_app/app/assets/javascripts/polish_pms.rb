require "react/test/utils" # just for mounting manually here, please ignore
require "data/polish_pms"

class PolishPMsComponent
  include Hyperloop::D3::Mixin

  render_with_selection do |selection, pm_data|
    svg = selection
            .attr("height", "600px")
            .attr("width", "100%")
    width = svg.style("width").to_i

    min_date = pm_data.map(&:start).min
    max_date = pm_data.map(&:end).max

    x = D3.scale_linear.domain([min_date, max_date]).range([100,width-90])
    y = D3.scale_linear.domain([0, pm_data.size+1]).range([0, 580])
    c = D3.scale_ordinal.range(D3.scheme_category_20)

    graph_area = svg.append("g")
        .attr("transform", "translate(60, 20)")

    graph_area.append("g")
      .select_all("rect")
      .data(pm_data).enter
      .append("rect")
        .attr("x"){|d| x.(d.start) }
        .attr("y"){|d,i| y.(i) }
        .attr("width"){|d| x.(d.end) - x.(d.start) }
        .attr("height"){|d,i| 0.8 * (y.(i+1) - y.(i)) }
        .attr("fill"){|d| c.(d.party)}

    graph_area.append("g")
      .select_all("text")
      .data(pm_data).enter
      .append("text")
        .text{|d| d.name}
        .attr("x"){|d| x.(d.start) - 4 }
        .attr("y"){|d,i| y.(i+0.5) }
        .attr("text-anchor", "end")
        .style("font-size", "12px")

    graph_area.append("g")
      .select_all("text")
      .data(pm_data).enter
      .append("text")
        .text{|d| d.party }
        .attr("x"){|d| x.(d.start) + 4 }
        .attr("y"){|d,i| y.(i+0.5) }
        .attr("text-anchor", "begin")
        .style("font-size", "12px")

    axis_bottom = D3.axis_bottom(x)
      .tick_format(D3.time_format("%B %Y"))
    graph_area.append("g").attr("transform", "translate(0, 560)").call(axis_bottom)
  end
end

# manual mount of component, usually you would use the react_component view helper for example
React.render(React.create_element(PolishPMsComponent, data: PolishPMs), `document.body.querySelector("#visualization")`)
