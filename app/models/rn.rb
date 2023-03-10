# frozen_string_literal: true

class Rn < ActiveRecord::Base
  def all_rn
    create_table :rn do |n|
      n.string :name
      n.string :begin_km
      n.string :end_km
      n.int :pk_begin
      n.int :pk_end
      n.double :length
    end
  end
end
