require_relative 'searchable_mod.rb'

class PolyTreeNode

  include Searchable

  attr_accessor :value
  attr_reader :parent, :children

  def initialize(value = nil)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent)
    return if self.parent == parent

    if self.parent
      self.parent.children.delete(self)
    end

    if parent != nil && !parent.children.include?(self)
      parent.children << self
    end
    @parent = parent

    self
  end

  def add_child(child)
    self.children << child unless self.children.include?(child)
    child.parent = self
  end

  def remove_child(child)
    if self.children.include?(child)
      child.parent = nil
    else
      raise "Node is not a child"
    end
  end



end

a = PolyTreeNode.new(1)
b = PolyTreeNode.new(2)
b.parent = a
c = PolyTreeNode.new(3)
c.parent = a
d = PolyTreeNode.new(4)
d.parent = b
a.dfs(4)
