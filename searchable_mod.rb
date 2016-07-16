module Searchable

  def dfs(target)
    return self if self.value == target
      self.children.each do |node|
        current_value = node.dfs(target)
        return current_value unless current_value.nil?
      end

    return nil
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      node = queue.shift
      if node.value == target
        return node
      elsif !self.children.empty?
        queue.concat(node.children)
      end
    end

    return nil
  end

end
