# frozen_string_literal: true

class Roads < ActiveRecord::Base
  def all_roads
    create_table :degradation_roads do |d|
      d.int :id
      d.int :idrns
      d.double :begin_pk
      d.double :end_pk
      d.double :width
      d.double :profondeur
    end
  end
end
