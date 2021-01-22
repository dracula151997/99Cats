require 'action_view'
# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = 
    [
        'black', 
        'white', 
        'orange', 
        'brown'
    ].freeze 

    validates_presence_of :birth_date, :color, :name, :sex, :description
    validates_inclusion_of :color, in: COLORS
    validates_inclusion_of :sex, in: %w(M F)
    
    def age
        time_ago_in_words(birth_date)
    end
end
