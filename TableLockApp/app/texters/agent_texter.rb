class AgentTexter < Textris::Base
  default from: '+12566900196'
  def alert(message,number)
    @message=message
    text to:number

  end

end