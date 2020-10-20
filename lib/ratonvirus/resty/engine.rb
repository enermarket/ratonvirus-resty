module Ratonvirus
  module Resty
    class Engine < ::Rails::Engine
      isolate_namespace Ratonvirus::Resty
    end
  end
end
