require "react/test/utils" # just for mounting manually here, please ignore
require "data/harry_potter"

class HarryPotterComponent
  include Hyperloop::D3::Mixin

  render_with_selection do |selection, hp_data|
    svg = selection
        .attr("height", "400px")
        .attr("width", "100%")
    width = svg.style("width").to_i

    bar_size = (400-40-20) / (hp_data.size)

    x = D3.scale_linear.domain(hp_data.map(&:date).minmax).range([200,width-90])
    y = D3.scale_ordinal.range(hp_data.size.times.map{|i| 40+i*bar_size}.reverse)
    s = D3.scale_sqrt.domain([0, hp_data.map(&:pages).max]).range([0,50])

    hp_data.each do |book|
      svg.append("text")
        .attr("x", x.(book.date))
        .attr("y", y.(book.title) + bar_size/2)
        .attr("font-size", s.(book.pages))
        .text("📖")
        .attr("text-anchor", "middle")
      svg.append("text")
        .attr("x", 0)
        .attr("y", y.(book.title) + bar_size/2)
        .text(book.title)
    end

    axis_bottom = D3.axis_bottom(x)
      .tick_format(D3.time_format("%Y-%m-%d"))
      .tick_values(hp_data.map(&:date))
    svg.append("g")
      .attr("transform", "translate(0, 380)")
      .call(axis_bottom)
  end
end

# manual mount of component, usually you would use the react_component view helper for example
React.render(React.create_element(HarryPotterComponent, data: HarryPotterBooks), `document.body.querySelector("#visualization")`)
