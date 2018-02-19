module D3
  class << self
    # These return functions in d3,
    # which doesn't feel very Ruby, so we call the functions
    aliases_d3 %i[
      randomUniform
      randomNormal
      randomLogNormal
      randomBates
      randomIrwinHall
      randomExponential
    ]
  end
end
