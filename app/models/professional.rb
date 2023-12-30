class Professional < ApplicationRecord
  has_many :career_opportunities
  has_many :career_guidance_sessions
end
