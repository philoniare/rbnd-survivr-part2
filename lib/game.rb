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
    new_tribe = Tribe.new({name: name, members: new_tribe_members})
    clear_tribes
    @tribes << new_tribe
    return new_tribe
  end

  def immunity_challenge
    lost_tribe = @tribes.sample
    lost_tribe.eliminate_member_from_tribe
    return lost_tribe
  end

  def individual_immunity_challenge
    merged_tribe = @tribes.first
    winner = merged_tribe.members.sample
    member_to_eliminate = merged_tribe.tribal_council(immune: winner)
    merged_tribe.eliminate_member_from_tribe
    return winner
  end

  def jury_challenge
    merged_tribe = @tribes.first
    new_jury = merged_tribe.members.sample
    merged_tribe.eliminate_specific_member_from_tribe(new_jury)
    return new_jury
  end
end
