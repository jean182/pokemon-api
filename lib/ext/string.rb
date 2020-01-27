# frozen_string_literal: true

# Custom method to check if string is an integer.
class String

  def integer?
    self =~ /\A[-+]?\d+\z/
  end

end
