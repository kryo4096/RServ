module RServ

  class HTTPResponse

    def initialize (status: 200,headers: {"Content-Type" => "text/plain"},content: "")
      @status_code = status
      @headers = headers
      @content = content
    end



    def content_type=(ct)
      @headers["Content-Type"]=ct
    end

    def to_s
      resp = StringIO::new("","w+")

      resp.puts Util::http_status_line(@version,@status_code)

      @headers.each do |k,v|
        resp.puts "#{k}: #{v}"
      end

      resp.puts

      resp.print @content

      return resp.string

    end

  end

end
