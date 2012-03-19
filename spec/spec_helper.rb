require 'rspec'

class Rails
  def self.root
    Pathname.new(__FILE__).dirname
  end
end

require 'multiple_mailers'
