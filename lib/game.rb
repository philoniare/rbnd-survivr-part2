class Game
  attr_reader :tribes
  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def clear_tribes
    @tribes = []
  end

  def merge(name)
    new_tribe_members = []
    @tribes.each do |tribe|
      new_tribe_members += tribe.members
    end
    Tribe.new({name: name, members: new_tribe_members})
  end

  def immunity_challenge
    @tribes.sample
  end

  def individual_immunity_challenge
    @tribes.sample.members.sample
  end
end
