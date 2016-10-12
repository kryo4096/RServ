require "gserver"

module RServ

  class HTTPServer < GServer
    def initialize(port=8080, *args)

      super(port, *args)
    end
    def serve(io)

      request = HTTPRequest.get_from_io(io)



      io.puts "HTTP/1.1 200 OK"
      io.puts "Content-Type: text/html"
      io.puts "Connection: close"
      io.puts "Refresh: 1"
      io.puts

      hist_body = HTMLBody.new

      io.print File.read("client.html") % {history: @chat_history,version: VERSION}

    end

    def stopping
      puts "rChat v#{VERSION} stopped."
    end

  end

end
