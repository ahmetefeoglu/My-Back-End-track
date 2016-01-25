class SecretHandshake
  attr_accessor :response, :secret_handshake
  def initialize(num)
    @num_str = num.to_s(2)
    @response = @num_str.chars
    a = @response.size
    if a < 5
      while a < 5
        @response.unshift("0")
        a += 1
      end
      
    end

    p @response
    
    @secret_handshake = []
    
  end


  def commands

    secret_handshake.push("jump") if response[1] == "1"
    secret_handshake.push("close your eyes") if response[2] == "1"
    secret_handshake.push("double blink") if response[3] == "1"
    secret_handshake.push("wink") if response[4] == "1"



    


    secret_handshake.reverse if response[0] == "1"
    p secret_handshake
    secret_handshake
  end



end

  handshake = SecretHandshake.new(19)
  handshake.commands
   
    
    



    
  




  