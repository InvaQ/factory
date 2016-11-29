class Factory

  def self.new(*params, &block)

    Class.new do

      attr_accessor(*params) 

      def initialize(*args)        
        members.zip(args).each do |member, arguments|
                          send("#{member}=", arguments)
        end
      end

      define_method :[] do |arg|
        arg.is_a?(Numeric) ? send(params[arg]) : send(arg)
      end

      define_method :members do        
        params
      end
      
      def values        
        members.map { |value| send(value) }        
      end

      def values_at(*args)
        values = []
        args.each do |argument|
          if argument.is_a? Fixnum
            values << send("#{members[argument]}")
          else
            values << send("#{argument}")
          end        
        end
        values
      end

      def ==(other_obj)
        return true if ((self.class == other_obj.class) && 
                          (values == other_obj.values))
          false
      end

      class_eval(block) if block_given?

    end
  end
end