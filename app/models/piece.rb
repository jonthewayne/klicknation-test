class Piece
  include Mongoid::Document
  field :name
  field :description
  field :attack, :type => Integer
  field :defense, :type => Integer 
  field :movement, :type => Integer
  field :cost, :type => Integer
  
  validates_presence_of :name
  validates_numericality_of :attack, :only_integer => true, :message => "can only be whole number."
  validates_numericality_of :defense, :only_integer => true, :message => "can only be whole number."
  validates_numericality_of :movement, :only_integer => true, :message => "can only be whole number."
  validates_numericality_of :cost, :only_integer => true, :message => "can only be whole number."
end
