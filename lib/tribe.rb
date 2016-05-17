class Tribe
  attr_reader :name, :members, :immune_members

  def initialize(tribe)
    @name = tribe[:name]
    @members = tribe[:members]
    @immune_members = []
    puts "Tribe #{@name.red} was created with members: \n"
    @members.each do |member|
      puts "    #{member.name.yellow}"
    end
  end

  def to_s
    "#{@name}"
  end

  def tribal_council(immune = nil)
    members_for_vote = @members
    if immune != nil
      @immune_members << immune[:immune]
      members_for_vote -= @immune_members
    end

    # Vote to eliminate non-immune members
    votes = Hash[members_for_vote.map {|member| [member, 0]}]
    @members.each do |member|
      voted_for = members_for_vote.sample
      votes[voted_for] += 1
    end

    # Return the member to be eliminated
    votes.max_by{|k,v| v}[0]
  end

  def eliminate_member_from_tribe
    member_to_eliminate = tribal_council
    @members -= [member_to_eliminate]
  end

  def eliminate_specific_member_from_tribe(member)
    @members -= [member]
  end
end
