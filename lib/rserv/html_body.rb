module RServ

  class HTMLBody

    def initialize
      @text = StringIO.new("","w+")
    end

    def to_s
      return @text.string
    end

    def h(n,content)
      self.tag("h#{n.to_s}",{} ,content)
    end

    def tag(tag,args,content)
     argstring = StringIO.new("","w+")
     args.each do |k,v|
       argstring.puts "\"#{k}\"=\"#{v}\" "
     end
     @text.puts "<#{tag} #{argstring.string}> #{content} </#{tag}>"
    end

    def block(tag,args)
      argstring = StringIO.new("","w+")
      args.each do |k,v|
        argstring.puts "\"#{k}\"=\"#{v}\" "
      end
      @text.puts"<#{tag} #{argstring.string}>"
      yield(self)
      @text.puts"</#{tag}>"
    end

  end

end
