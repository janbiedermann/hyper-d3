module Hyperloop
  module D3
    class Component
      include Hyperloop::D3::Mixin
      def self.inherited(base)
        base.class_eval do
          param data: nil
        end
      end
    end
  end
end