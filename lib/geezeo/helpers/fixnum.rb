class Fixnum
  def days
    self * 60 * 60 * 24
  end

  def ago
    Time.now - self
  end
end
