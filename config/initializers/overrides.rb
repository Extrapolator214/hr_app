class Array
  require 'set'
  def included_in? array
    array.to_set.superset?(self.to_set)
  end
end