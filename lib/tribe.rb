class Tribe
  attr_reader :name, :members
  def initialize(tribe)
    @name = tribe[:name]
    @members = tribe[:members]
    puts "Tribe #{@name} was created with members: \n"
    @members.each do |member|
      puts "    #{member.name}"
    end
  end

  def to_s
    return "#{@name}"
  end

  def tribal_council(immune)
    members_for_vote = @members - [immune[:immune]]
    p immune
    # Vote to eliminate non-immune members
    votes = Hash[members_for_vote.map {|member| [member, 0]}]
    @members.each do |member|
      voted_for = members_for_vote.sample
      votes[voted_for] += 1
    end

    # Return the member to be eliminated
    votes.max_by{|k,v| v}[0]
  end
end
