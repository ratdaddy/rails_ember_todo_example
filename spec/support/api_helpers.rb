module ApiHelpers
  module Json
    def json
      @json ||= JSON.parse(response.body)
    end
  end
end
