module RServ

  # HTTP Request Class, supports building from IO
  class HTTPRequest

    @action = :GET
    @status = ""
    @path = ""
    @args = {}
    @headers = {}

    attr_reader(:status,:action,:path,:args,:headers)

    def initialize(action,path,args,status,headers)
      @action = action
      @status = status
      @path = path
      @args = args
      @headers = headers
    end

    def get_from_io(io)
      req_line, *header_lines = io.each_line.to_a
      req_action, req, req_status = req_line.split(" ")
      req_path, req_argstring = req.split("?")
      req_argstring.split("&").each do |arg|
        k,v = arg.split("=")
        req_args[k]=v
      end

      header_lines.each do |header|
        k,v = header.split(": ")
        req_headers[k]=v
      end

      req_action = req_action.to_sym

      return self::new(req_action,req_path,req_args,req_status,req_headers)
    end

  end

end
