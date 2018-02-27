require_relative 'identificator/unknown_request'

class Identificator
  def self.identify(_request)
    UnknownRequest.new
  end
end
