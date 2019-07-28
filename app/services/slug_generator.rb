# frozen_string_literal: true

class SlugGenerator
  HASHID_ALPHABET = ('a'..'z').to_a.join + ('0'..'9').to_a.join

  attr_reader :slug

  def initialize(id)
    hashid = Hashids.new(Settings.hash_id_salt, 5, HASHID_ALPHABET)
    @slug = hashid.encode(id)
  end
end
