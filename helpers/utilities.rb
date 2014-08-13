
require "money"

class Numeric
  # def to_currency( currency_symbol='', thousands=' ', decimal='.' )
  #   "#{
  #   ( "%.2f" % self ).gsub(/(\d)(?=(?:\d{3})+(?:$|\.))/, "\\1#{thousands}")
  #   } #{currency_symbol}"
  # end

  # def to_currency()
  #   while self.to_s..sub!(/(\d+)(\d\d\d)/,'\1 \2'); end
  #   self
  # end

  def to_money
    Money.new(self*100, "USD")
  end
end

class String
  def dasherize
    self.gsub! "_", "-"
  end
end

class Counter
  attr_accessor :value
  def initialize(i=0)
    @value = i
  end
  def inc!
    @value = @value.succ
  end
  def dec!
    @value = @value.pred
  end
  def succ
    @value.succ
  end
  def pred
    @value.pred
  end
end

# p ["2B71F".hex].pack("U")
# p "\u{2B71F}", "\u2B71F".encode("utf-8"), "\u{0440}", "\u{0443}", "\u{0431}"

module Utilities
  def money value
    value.to_f.to_money.format(
      # :symbol_before_without_space
      :symbol => false,
      :symbol_position => :after,
      :thousands_separator => " ",
      :no_cents_if_whole => true
    )
  end

  def price value
    value.to_f.to_money.format(
      # :symbol_before_without_space
      :symbol => false,
      :symbol_position => :after,
      :thousands_separator => " ",
      :no_cents_if_whole => false
    )
  end

  def new_counter from=0
    Counter.new from
  end

  def str_rand digits=5
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    (0...digits).map { o[rand(o.length)] }.join
  end
end

