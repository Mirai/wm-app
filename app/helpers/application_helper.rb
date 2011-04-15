module ApplicationHelper
  def bool2Affirm bool
    if bool
      'YES'
    else
      'NO'
    end
  end
  
  def statDash stat
    if stat.nil?
      '-'
    else
      stat
    end
  end
end
