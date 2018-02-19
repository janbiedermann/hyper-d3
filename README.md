# Hyper-D3

A [Ruby-Hyperloop](https://ruby-hyperloop.org/) Component including a
Opal Ruby interface for D3 [https://d3js.org/].

It implements interface fairly closely following javascript API, except with blocks, classes, no camelcase etc.

About 60% of D3 APIs are implemented. Pull requests for the rest are very welcome.

[Opal-D3](https://taw.github.io/opal-d3/) was orginally developed by Tomasz Wegrzanowski, @taw.

## Installation

in your ruby-hyperloop application or your rails apps Gemfile add:
```
gem 'hyper-d3'
```
bundle update, done.

## Usage

There are various examples in the `spec/test_app/app/assets/javascripts` directory.
Git clone this repo, cd to spec/test_app, bundle update, rails s and visit [http://localhost:3000] to see them in action.

## Commented Example

To achieve this:
![Star Trek Voyager Demo](https://github.com/janbiedermann/hyper-d3/blob/hyperloopification/startrekvoyager.png?raw=true)

Do this:
```ruby
# create your component class, either by inheriting from Hyperloop::D3::Component:
class StarTrekVoyagerComponent < Hyperloop::D3::Component
  # or you include the Hyperloop::D3::Mixin like this:
  # include Hyperloop::D3::Mixin

  # Thy Hyperloop::D3::Component provides a convenience render method 'render_with_selection'
  # and with that, takes care of all the things that need to be done for react, to use D3.js
  # This method provides two arguments to the block, a D3::Selection, and the data that has 
  # been passed in as param for the component.
  # By default, render_with_selection will provide a empty <svg> as selection,
  # here the 'DIV' is passed as argument to render_with_selection, the selection argument
  # passed to the block therefore is a <div>
  # Within the block, just use the selection as you usually would with D3.

  # You would mount or render that Component with the data as paramter, like:
  # StarTrekVoyagerComponent(data: VoyagerData)

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
```

### Reactive D3
If you need the component to be "reactive", you mount the component within a outer component and make the data
depending on state, for example:
```
class OuterComponent
  render('DIV') do
    StarTrekVoyagerComponent(data: state.data)
  end
end
```
When state.data changes, the StarTrekVoaygerComponent will receive that as new param and render with the new data.
**Its important to note** though, that react doesnt do the diff for native js dom manipulations, that means, if the
component receives new data, it must do the DOM housekeeping itself, remove dom nodes or add or replace them within
the block passed to render_with_selection.

### Events
Events in the D3 classes are currentyly badly supported. You must most probably revert to native JS inlining.
To clean up the event handlers, you can use the before_unmount_with_selection callback. It will be called with the root
selection and the most recent data received:
```ruby
class StarTrekVoyagerComponent < Hyperloop::D3::Component
  before_unmount_with_selection do |selection, voyager_data|
    # here called with the <div> as D3 selection, because of render_with_selection('DIV')
    # clean up event handlers or anything else here
  end

  render_with_selection('DIV') do |selection, voyager_data|
    # draw here
  end
end
```
