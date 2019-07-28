# frozen_string_literal: true

class SavedConfiguration < ApplicationRecord
  after_create :generate_slug

private

  def generate_slug
    self.slug = SlugGenerator.new(id).slug
    self.save
  end
end
