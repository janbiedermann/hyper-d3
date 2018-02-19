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
<div>
<svg height="600px" width="100%">
<line x1="40" x2="126.98224852071007" y1="296.8468468468468" y2="296.8468468468468" stroke="#1f77b4" stroke-width="2" opacity="0.4"/><line x1="133.19526627218934" x2="288.5207100591716" y1="289.08523908523904" y2="289.08523908523904" stroke="#ff7f0e" stroke-width="2" opacity="0.4"/><line x1="294.73372781065086" x2="450.0591715976331" y1="271.41372141372125" y2="271.41372141372125" stroke="#2ca02c" stroke-width="2" opacity="0.4"/><line x1="456.27218934911247" x2="611.5976331360947" y1="223.07692307692332" y2="223.07692307692332" stroke="#d62728" stroke-width="2" opacity="0.4"/><line x1="617.810650887574" x2="773.1360946745563" y1="235.0311850311852" y2="235.0311850311852" stroke="#9467bd" stroke-width="2" opacity="0.4"/><line x1="779.3491124260355" x2="934.6745562130178" y1="265.1767151767154" y2="265.1767151767154" stroke="#8c564b" stroke-width="2" opacity="0.4"/><line x1="940.887573964497" x2="1090" y1="243.51351351351354" y2="243.51351351351354" stroke="#e377c2" stroke-width="2" opacity="0.4"/><circle cx="40" cy="266.2162162162163" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="46.21301775147929" cy="293.2432432432433" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="52.426035502958584" cy="293.2432432432433" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="58.63905325443787" cy="293.2432432432433" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="64.85207100591717" cy="387.8378378378378" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="71.06508875739645" cy="158.10810810810824" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="77.27810650887574" cy="360.8108108108109" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="83.49112426035504" cy="360.8108108108109" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="89.70414201183432" cy="266.2162162162163" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="95.9171597633136" cy="225.6756756756758" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="102.1301775147929" cy="347.2972972972973" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="108.34319526627219" cy="347.2972972972973" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="114.55621301775147" cy="279.7297297297298" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="120.76923076923077" cy="279.7297297297298" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="126.98224852071007" cy="293.2432432432433" r="4" fill="#1f77b4" opacity="0.6"/><circle cx="133.19526627218934" cy="266.2162162162163" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="139.40828402366864" cy="374.3243243243244" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="145.6213017751479" cy="185.13513513513516" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="151.8343195266272" cy="455.4054054054054" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="158.0473372781065" cy="320.27027027027026" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="164.2603550295858" cy="306.7567567567568" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="170.47337278106508" cy="401.3513513513514" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="176.68639053254438" cy="320.27027027027026" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="182.89940828402368" cy="414.8648648648649" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="189.11242603550295" cy="279.7297297297298" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="195.32544378698225" cy="293.2432432432433" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="201.53846153846155" cy="306.7567567567568" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="207.75147928994085" cy="239.18918918918928" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="213.96449704142015" cy="279.7297297297298" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="220.1775147928994" cy="550" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="226.3905325443787" cy="185.13513513513516" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="232.60355029585799" cy="225.6756756756758" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="238.81656804733728" cy="131.08108108108104" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="245.02958579881656" cy="252.7027027027027" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="251.24260355029585" cy="252.7027027027027" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="257.4556213017752" cy="144.59459459459475" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="263.6686390532544" cy="360.8108108108109" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="269.8816568047337" cy="266.2162162162163" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="276.094674556213" cy="239.18918918918928" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="282.3076923076923" cy="266.2162162162163" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="288.5207100591716" cy="198.64864864864876" r="4" fill="#ff7f0e" opacity="0.6"/><circle cx="294.73372781065086" cy="198.64864864864876" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="300.94674556213016" cy="212.1621621621622" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="307.1597633136095" cy="347.2972972972973" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="313.37278106508876" cy="306.7567567567568" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="319.58579881656806" cy="360.8108108108109" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="325.79881656804736" cy="293.2432432432433" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="332.0118343195266" cy="468.91891891891896" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="338.2248520710059" cy="131.08108108108104" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="344.4378698224852" cy="144.59459459459475" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="350.6508875739645" cy="347.2972972972973" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="356.8639053254438" cy="279.7297297297298" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="363.0769230769231" cy="279.7297297297298" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="369.28994082840234" cy="347.2972972972973" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="375.5029585798817" cy="360.8108108108109" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="381.71597633136093" cy="306.7567567567568" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="387.9289940828403" cy="279.7297297297298" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="394.14201183431953" cy="198.64864864864876" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="400.3550295857988" cy="387.8378378378378" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="406.56804733727813" cy="333.78378378378386" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="412.7810650887574" cy="441.89189189189193" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="418.9940828402367" cy="198.64864864864876" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="425.20710059171597" cy="266.2162162162163" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="431.42011834319527" cy="104.05405405405412" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="437.63313609467457" cy="252.7027027027027" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="443.84615384615387" cy="158.10810810810824" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="450.0591715976331" cy="50" r="4" fill="#2ca02c" opacity="0.6"/><circle cx="456.27218934911247" cy="63.51351351351349" r="4" fill="#d62728" opacity="0.6"/><circle cx="462.4852071005917" cy="198.64864864864876" r="4" fill="#d62728" opacity="0.6"/><circle cx="468.698224852071" cy="266.2162162162163" r="4" fill="#d62728" opacity="0.6"/><circle cx="474.9112426035503" cy="333.78378378378386" r="4" fill="#d62728" opacity="0.6"/><circle cx="481.12426035502955" cy="252.7027027027027" r="4" fill="#d62728" opacity="0.6"/><circle cx="487.3372781065089" cy="266.2162162162163" r="4" fill="#d62728" opacity="0.6"/><circle cx="493.55029585798815" cy="185.13513513513516" r="4" fill="#d62728" opacity="0.6"/><circle cx="499.76331360946745" cy="63.51351351351349" r="4" fill="#d62728" opacity="0.6"/><circle cx="505.97633136094674" cy="90.54054054054063" r="4" fill="#d62728" opacity="0.6"/><circle cx="512.189349112426" cy="333.78378378378386" r="4" fill="#d62728" opacity="0.6"/><circle cx="518.4023668639054" cy="333.78378378378386" r="4" fill="#d62728" opacity="0.6"/><circle cx="524.6153846153846" cy="347.2972972972973" r="4" fill="#d62728" opacity="0.6"/><circle cx="530.8284023668639" cy="225.6756756756758" r="4" fill="#d62728" opacity="0.6"/><circle cx="537.0414201183432" cy="63.51351351351349" r="4" fill="#d62728" opacity="0.6"/><circle cx="543.2544378698225" cy="198.64864864864876" r="4" fill="#d62728" opacity="0.6"/><circle cx="549.4674556213017" cy="158.10810810810824" r="4" fill="#d62728" opacity="0.6"/><circle cx="555.6804733727811" cy="333.78378378378386" r="4" fill="#d62728" opacity="0.6"/><circle cx="561.8934911242603" cy="198.64864864864876" r="4" fill="#d62728" opacity="0.6"/><circle cx="568.1065088757397" cy="212.1621621621622" r="4" fill="#d62728" opacity="0.6"/><circle cx="574.319526627219" cy="360.8108108108109" r="4" fill="#d62728" opacity="0.6"/><circle cx="580.5325443786982" cy="252.7027027027027" r="4" fill="#d62728" opacity="0.6"/><circle cx="586.7455621301775" cy="387.8378378378378" r="4" fill="#d62728" opacity="0.6"/><circle cx="592.9585798816569" cy="63.51351351351349" r="4" fill="#d62728" opacity="0.6"/><circle cx="599.1715976331361" cy="293.2432432432433" r="4" fill="#d62728" opacity="0.6"/><circle cx="605.3846153846154" cy="158.10810810810824" r="4" fill="#d62728" opacity="0.6"/><circle cx="611.5976331360947" cy="158.10810810810824" r="4" fill="#d62728" opacity="0.6"/><circle cx="617.810650887574" cy="212.1621621621622" r="4" fill="#9467bd" opacity="0.6"/><circle cx="624.0236686390532" cy="104.05405405405412" r="4" fill="#9467bd" opacity="0.6"/><circle cx="630.2366863905326" cy="333.78378378378386" r="4" fill="#9467bd" opacity="0.6"/><circle cx="636.4497041420118" cy="185.13513513513516" r="4" fill="#9467bd" opacity="0.6"/><circle cx="642.6627218934912" cy="401.3513513513514" r="4" fill="#9467bd" opacity="0.6"/><circle cx="648.8757396449704" cy="77.0270270270272" r="4" fill="#9467bd" opacity="0.6"/><circle cx="655.0887573964498" cy="225.6756756756758" r="4" fill="#9467bd" opacity="0.6"/><circle cx="661.301775147929" cy="293.2432432432433" r="4" fill="#9467bd" opacity="0.6"/><circle cx="667.5147928994083" cy="279.7297297297298" r="4" fill="#9467bd" opacity="0.6"/><circle cx="673.7278106508876" cy="198.64864864864876" r="4" fill="#9467bd" opacity="0.6"/><circle cx="679.9408284023668" cy="131.08108108108104" r="4" fill="#9467bd" opacity="0.6"/><circle cx="686.1538461538462" cy="252.7027027027027" r="4" fill="#9467bd" opacity="0.6"/><circle cx="692.3668639053254" cy="266.2162162162163" r="4" fill="#9467bd" opacity="0.6"/><circle cx="698.5798816568047" cy="225.6756756756758" r="4" fill="#9467bd" opacity="0.6"/><circle cx="704.792899408284" cy="117.56756756756755" r="4" fill="#9467bd" opacity="0.6"/><circle cx="711.0059171597634" cy="117.56756756756755" r="4" fill="#9467bd" opacity="0.6"/><circle cx="717.2189349112425" cy="347.2972972972973" r="4" fill="#9467bd" opacity="0.6"/><circle cx="723.4319526627219" cy="212.1621621621622" r="4" fill="#9467bd" opacity="0.6"/><circle cx="729.6449704142012" cy="536.4864864864866" r="4" fill="#9467bd" opacity="0.6"/><circle cx="735.8579881656806" cy="225.6756756756758" r="4" fill="#9467bd" opacity="0.6"/><circle cx="742.0710059171597" cy="333.78378378378386" r="4" fill="#9467bd" opacity="0.6"/><circle cx="748.2840236686391" cy="158.10810810810824" r="4" fill="#9467bd" opacity="0.6"/><circle cx="754.4970414201184" cy="360.8108108108109" r="4" fill="#9467bd" opacity="0.6"/><circle cx="760.7100591715975" cy="104.05405405405412" r="4" fill="#9467bd" opacity="0.6"/><circle cx="766.9230769230769" cy="293.2432432432433" r="4" fill="#9467bd" opacity="0.6"/><circle cx="773.1360946745563" cy="117.56756756756755" r="4" fill="#9467bd" opacity="0.6"/><circle cx="779.3491124260355" cy="144.59459459459475" r="4" fill="#8c564b" opacity="0.6"/><circle cx="785.5621301775147" cy="239.18918918918928" r="4" fill="#8c564b" opacity="0.6"/><circle cx="791.7751479289941" cy="387.8378378378378" r="4" fill="#8c564b" opacity="0.6"/><circle cx="797.9881656804733" cy="104.05405405405412" r="4" fill="#8c564b" opacity="0.6"/><circle cx="804.2011834319527" cy="374.3243243243244" r="4" fill="#8c564b" opacity="0.6"/><circle cx="810.4142011834319" cy="266.2162162162163" r="4" fill="#8c564b" opacity="0.6"/><circle cx="816.6272189349113" cy="225.6756756756758" r="4" fill="#8c564b" opacity="0.6"/><circle cx="822.8402366863905" cy="225.6756756756758" r="4" fill="#8c564b" opacity="0.6"/><circle cx="829.0532544378698" cy="252.7027027027027" r="4" fill="#8c564b" opacity="0.6"/><circle cx="835.2662721893491" cy="131.08108108108104" r="4" fill="#8c564b" opacity="0.6"/><circle cx="841.4792899408284" cy="414.8648648648649" r="4" fill="#8c564b" opacity="0.6"/><circle cx="847.6923076923077" cy="50" r="4" fill="#8c564b" opacity="0.6"/><circle cx="853.905325443787" cy="293.2432432432433" r="4" fill="#8c564b" opacity="0.6"/><circle cx="860.1183431952662" cy="306.7567567567568" r="4" fill="#8c564b" opacity="0.6"/><circle cx="866.3313609467456" cy="293.2432432432433" r="4" fill="#8c564b" opacity="0.6"/><circle cx="872.5443786982249" cy="266.2162162162163" r="4" fill="#8c564b" opacity="0.6"/><circle cx="878.7573964497041" cy="414.8648648648649" r="4" fill="#8c564b" opacity="0.6"/><circle cx="884.9704142011834" cy="320.27027027027026" r="4" fill="#8c564b" opacity="0.6"/><circle cx="891.1834319526628" cy="252.7027027027027" r="4" fill="#8c564b" opacity="0.6"/><circle cx="897.396449704142" cy="293.2432432432433" r="4" fill="#8c564b" opacity="0.6"/><circle cx="903.6094674556213" cy="279.7297297297298" r="4" fill="#8c564b" opacity="0.6"/><circle cx="909.8224852071006" cy="347.2972972972973" r="4" fill="#8c564b" opacity="0.6"/><circle cx="916.03550295858" cy="401.3513513513514" r="4" fill="#8c564b" opacity="0.6"/><circle cx="922.2485207100591" cy="144.59459459459475" r="4" fill="#8c564b" opacity="0.6"/><circle cx="928.4615384615385" cy="293.2432432432433" r="4" fill="#8c564b" opacity="0.6"/><circle cx="934.6745562130178" cy="171.62162162162167" r="4" fill="#8c564b" opacity="0.6"/><circle cx="940.887573964497" cy="185.13513513513516" r="4" fill="#e377c2" opacity="0.6"/><circle cx="947.1005917159763" cy="239.18918918918928" r="4" fill="#e377c2" opacity="0.6"/><circle cx="953.3136094674556" cy="306.7567567567568" r="4" fill="#e377c2" opacity="0.6"/><circle cx="959.5266272189349" cy="347.2972972972973" r="4" fill="#e377c2" opacity="0.6"/><circle cx="965.7396449704141" cy="212.1621621621622" r="4" fill="#e377c2" opacity="0.6"/><circle cx="971.9526627218935" cy="266.2162162162163" r="4" fill="#e377c2" opacity="0.6"/><circle cx="978.1656804733728" cy="198.64864864864876" r="4" fill="#e377c2" opacity="0.6"/><circle cx="984.3786982248521" cy="360.8108108108109" r="4" fill="#e377c2" opacity="0.6"/><circle cx="990.5917159763313" cy="225.6756756756758" r="4" fill="#e377c2" opacity="0.6"/><circle cx="996.8047337278107" cy="225.6756756756758" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1003.0177514792899" cy="144.59459459459475" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1009.2307692307693" cy="320.27027027027026" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1015.4437869822485" cy="266.2162162162163" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1021.6568047337278" cy="279.7297297297298" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1027.8698224852071" cy="171.62162162162167" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1034.0828402366865" cy="225.6756756756758" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1040.2958579881656" cy="212.1621621621622" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1046.508875739645" cy="279.7297297297298" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1052.7218934911243" cy="252.7027027027027" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1058.9349112426034" cy="198.64864864864876" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1065.1479289940828" cy="306.7567567567568" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1071.3609467455622" cy="293.2432432432433" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1077.5739644970415" cy="239.18918918918928" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1083.7869822485206" cy="225.6756756756758" r="4" fill="#e377c2" opacity="0.6"/><circle cx="1090" cy="104.05405405405412" r="4" fill="#e377c2" opacity="0.6"/><g transform="translate(30, 0)" fill="none" font-size="10" font-family="sans-serif" text-anchor="end"><path class="domain" stroke="#000" d="M-6,550.5H0.5V50.5H-6"/><g class="tick" opacity="1" transform="translate(0,509.9594594594595)"><line stroke="#000" x2="-6"/><text fill="#000" x="-9" dy="0.32em">5.5</text></g><g class="tick" opacity="1" transform="translate(0,442.39189189189193)"><line stroke="#000" x2="-6"/><text fill="#000" x="-9" dy="0.32em">6.0</text></g><g class="tick" opacity="1" transform="translate(0,374.8243243243244)"><line stroke="#000" x2="-6"/><text fill="#000" x="-9" dy="0.32em">6.5</text></g><g class="tick" opacity="1" transform="translate(0,307.2567567567568)"><line stroke="#000" x2="-6"/><text fill="#000" x="-9" dy="0.32em">7.0</text></g><g class="tick" opacity="1" transform="translate(0,239.68918918918928)"><line stroke="#000" x2="-6"/><text fill="#000" x="-9" dy="0.32em">7.5</text></g><g class="tick" opacity="1" transform="translate(0,172.12162162162167)"><line stroke="#000" x2="-6"/><text fill="#000" x="-9" dy="0.32em">8.0</text></g><g class="tick" opacity="1" transform="translate(0,104.55405405405412)"><line stroke="#000" x2="-6"/><text fill="#000" x="-9" dy="0.32em">8.5</text></g></g></svg></div></div>

Do this:
```ruby
# create your component class, either by inheriting from Hyperloop::D3::Component:
class StarTrekVoyagerComponent < Hyperloop::D3::Component
  # or you include the Hyperloop::D3::Mixin like this:
  # include Hyperloop::D3::Mixin

  # Thy Hyperloop::D3::Component provides a convenience render method 'render_with_selection'
  # and with that takes care of all the things that need to be done for react, to use D3.js
  # This method provides to arguments, a D3::Selection, and the data that has been passed in as param
  # for the component.
  # By default, render_with_selection will provide a empty <svg> as selection, here the 'DIV' is passed
  # as argument to render_with_selection, the selection argument passed to the block therefore is a <div>
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
*'Its important to note** though, that react doesnt do the diff for native js dom manipulations, that means, if the
component receives new data, it must do the DOM housekeeping itself, remove dom nodes or add or replace them.

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
