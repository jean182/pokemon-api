class String
  def is_integer?
    /\A[-+]?\d+\z/ === self
  end
end
