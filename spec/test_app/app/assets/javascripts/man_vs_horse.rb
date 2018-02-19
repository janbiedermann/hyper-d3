require "react/test/utils" # just for mounting manually here, please ignore
require "data/man_vs_horse"

class ManHorseComponent
  include Hyperloop::D3::Mixin

  render_with_selection do |selection, mh_data|
    svg = selection
            .attr("height", "1200px")
            .attr("width", "100%")
    width = svg.style("width").to_i

    max_time = mh_data.flat_map{|d| [d.horse_time, d.human_time]}.max
    min_year = mh_data.map(&:year).min
    max_year = mh_data.map(&:year).max

    x = D3.scale_linear.domain([0, max_time]).range([0,width-90]).nice
    y = D3.scale_linear.domain([min_year, max_year+1]).range([0, 1160])
    c = D3.scale_ordinal.range(D3.scheme_category_10)

    graph_area = svg.append("g")
      .attr("transform", "translate(60, 20)")

    graph_area.append("g")
      .select_all("rect")
      .data(mh_data).enter
      .append("rect")
        .attr("x"){|d| 0 }
        .attr("y"){|d| y.(d.year) }
        .attr("width"){|d| x.(d.horse_time) }
        .attr("height"){|d,i| 0.35 * (y.(i+1) - y.(i)) }
        .attr("fill"){|d| c.("horse") }

    graph_area.append("g")
      .select_all("rect")
      .data(mh_data).enter
      .append("rect")
        .attr("x"){|d| 0 }
        .attr("y"){|d| y.(d.year+0.45) }
        .attr("width"){|d| x.(d.human_time) }
        .attr("height"){|d,i| 0.35 * (y.(i+1) - y.(i)) }
        .attr("fill"){|d| c.("man") }

    svg.append("g")
      .attr("transform", "translate(0, 20)")
      .select_all("text")
      .data(mh_data).enter
      .append("text")
        .attr("x"){|d| 0 }
        .attr("y"){|d| y.(d.year+0.5) }
        .text{|d| (d.winner == "Horse" ? "🐎" : "🏃") + " #{d.year}" }

    axis_bottom = D3.axis_bottom(x)
      .tick_format{|v| h = (v / 60).floor; m  = (v % 60).floor; "%d:%02d" % [h,m] }
    graph_area.append("g").attr("transform", "translate(0, 1160)").call(axis_bottom)
  end
end

# manual mount of component, usually you would use the react_component view helper for example
React.render(React.create_element(ManHorseComponent, data: ManVsHorse), `document.body.querySelector("#visualization")`)
