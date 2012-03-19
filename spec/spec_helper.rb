require 'rspec'

class Rails
  def self.root
    Pathname.new(__FILE__).dirname
  end

  def self.env
    "production"
  end
end

require 'multiple_mailers'
