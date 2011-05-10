module DashToNull
  
  def self.included(base)
    base.send :before_save, :convertDash2Null
  end
  
  def convertDash2Null
    self.attributes.each_pair do |k,v|
      self.send "#{k}=", nil if v == '-' || v == 0
    end
  end
end