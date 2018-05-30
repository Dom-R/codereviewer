# frozen_string_literal: true

require "settingslogic"

class Settings < Settingslogic
  source "settings.yaml"
  namespace ENV["RACK_ENV"]
  load!
end
