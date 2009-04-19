require "ostruct"
require "cart/config"

class CartItem < OpenStruct
  undef :id
end

# NOTE: all public methods works with products, not with their IDs
class Cart
  def self.load(data)
    cart = Cart.new
    @config = Cart
    unless data.nil?
      cart.items = YAML::load(data)
      cart.items.map! { |item| item.count = item.count.to_i; item }
    end
    return cart
  end

  # returns array of products
  def items
    @items
    #.map { |item| @config.product_model.get(item) }
  end

  def inspect
    %{<cart @items=#{@config.product_model}#{@items.map { |i| i.id }.inspect}>}
  end

  # takes array of products
  def items=(products)
    raise ArgumentError if not products.respond_to?(:each) # not just arrays
    raise ArgumentError if not products.all? { |product| @config.product_model.get(product.id) }
    @items = products
    # @items = products.map do |product|
    #   struct = CartItem.new
    #   struct.id = product.id
    #   struct.count = count
    # end
  end

  def initialize
    @items = Array.new
    @config = self.class
  end

  def save
    YAML::dump(@items)
  end

  def add(product, count = 1, sort = nil)
    raise ArgumentError unless product.kind_of?(@config.product_model)
    count = count.to_i
    if item = find(product)
      item.count += count
    else
      struct = CartItem.new
      struct.id = product.id
      struct.count = count
      @items.push(struct)
    end
    self.sort(sort)
  end

  # remove all products with id 1
  # cart.remove(1)
  # remove 2 products with id 1
  # cart.remove(1, 2)
  def remove(product, count = nil, sort = nil)
    if item = find(product)
      if count.nil? || item.count <= count
        @items.delete(item)
      elsif item.count > count
        item.count = (item.count - count)
      end
    end
    self.sort(sort)
  end
  
  def update(product, count = nil)
    if (item = find(product)) && !count.nil?
      item.count = count
    end
  end

  def empty?
    @items.empty?
  end
  
  def empty!
    @items = Array.new
  end

  def quantity(product)
    if item = find(product)
      return item.count
    end
    return 0
  end

  protected
  def find(product)
    @items.find { |item| item.id.eql?(product.id) }
  end
  
  def sort(field)
    if !field.nil? && !@config.product_model.instance_methods.index(field.to_s).nil?
      @items = @items.sort { |a,b| @config.product_model.get(a.id).send(field) <=> @config.product_model.get(b.id).send(field) }
    end
  end
end
