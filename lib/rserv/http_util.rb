require "./info"

module RServ
  module HTTPUtils
    def http_status_line(code)
      return "HTTP/#{$HTTP_VERSION} #{code} #{$HTTP_STATUS_CODES[code.to_s.to_sym]}"
    end
  end
end
