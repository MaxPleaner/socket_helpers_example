class Symbol
  def call(*args, &block)
    ->(caller, *rest) { caller.send(self, *rest, *args, &block) }
  end
end

# this is so you can you can use arguments with the (&:sym) shortcut!

# i.e. [1,2,3].map(&:+.(1))
#   => [2,3,4] !!!