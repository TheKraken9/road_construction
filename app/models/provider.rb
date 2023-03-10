# frozen_string_literal: true

class Provider < ActiveRecord::Base
  def all_provider
    create_table :provider do |p|
      p.string :name
      p.double :speed
      p.int :emp
      p.date :birthday
      p.double :penalty
      p.double :price
    end
  end
end
