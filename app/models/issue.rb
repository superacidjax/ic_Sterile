class Issue < ActiveRecord::Base
  TYPES = %w(abuse academics addiction anger anxiety attention bipolar bullying
             career crisis culture_religion depression eating expat family
             fears goals grief life_transitions military money moods
             panic_attacks parenting post_trauma pregnancy pre_marriage
             relationships self_improvement separation stress suicide
             thinking_problems)

  has_many :concerns
  has_many :specialities
end
