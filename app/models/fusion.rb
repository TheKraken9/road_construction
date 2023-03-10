# frozen_string_literal: true

class Fusion < ActiveRecord::Base
  def my_fusion
    create_table :fusion do |f|
      f.string :name
      f.double :penalty
      f.double :speed
      f.int :emp
      f.double :price
      f.double :anc
      f.double :formulas
      f.double :rapport
    end
  end
end
