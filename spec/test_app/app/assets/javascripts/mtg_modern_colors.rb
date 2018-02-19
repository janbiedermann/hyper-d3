require "hyper-d3"
require "data/mtg_modern_colors"

class ModernColorsComponent
  include Hyperloop::D3::Mixin

  render_with_selection('DIV') do |selection, colors_data|
    flex = selection
      .style("display", "flex")
      .style("flex-wrap", "wrap")

      colors_data.group_by(&:cmc).sort.each do |cmc, cards|
      svg = flex.append("svg")
        .attr("height", "200px")
        .attr("width", "200px")
      graph_area = svg
        .append("g")
        .attr("transform", "translate(100,100)")
      graph_area.append("text")
        .attr("text-anchor", "middle")
        .attr("y", 10)
        .text(cmc)
        .attr("font-size", "30px")

      cards.sort_by!{|c| "wubrgxm".index(c.color)}
      pie = D3.pie.value(&:count).sort(nil)

      pie.(cards).each do |arc_data|
        arc = D3.arc
          .inner_radius(40)
          .outer_radius(90)
          .start_angle(arc_data[:start_angle])
          .end_angle(arc_data[:end_angle])

        color = {
          w: "white",
          u: "blue",
          b: "black",
          r: "red",
          g: "green",
          x: "grey",
          m: "yellow",
        }[arc_data[:data].color]

        graph_area.append("path")
          .attr("d", arc.())
          .attr("fill", color)
          .attr("stroke", "black")
          .attr("stroke-width", "1px")
      end
    end
  end
end

# manual mount of component, usually you would use the react_component view helper for example
React.render(React.create_element(ModernColorsComponent, data: MtgModernColors), `document.body.querySelector("#visualization")`)
