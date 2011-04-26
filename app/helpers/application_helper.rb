module ApplicationHelper
  def bool2Affirm bool
    if bool
      'YES'
    else
      'NO'
    end
  end
  
  def statDash stat
    if stat.to_s.empty?
      '-'
    else
      stat
    end
  end 
end
