# frozen_string_literal: true

Dir["#{File.dirname(__FILE__)}/api/*.rb"].each do |path|
  require path
end
