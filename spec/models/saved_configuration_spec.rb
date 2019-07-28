# frozen_string_literal: true

require 'rails_helper'

describe SavedConfiguration do
  it "generates a slug on save" do
    saved_config = SavedConfiguration.new(effect: 'processing')
    saved_config.save
    expect(saved_config.slug).not_to be_nil
  end
end
