class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def members
    @members
  end

  def cast_votes(finalists)
    votes = Hash[finalists.map {|finalist| [finalist, 0]}]
    @members.each do |member|
      voted_for = finalists.sample
      puts "Judge #{member.name.blue} voted for finalist #{voted_for.name.green}."
      votes[voted_for] += 1
    end
    votes
  end

  def report_votes(final_votes)
    final_votes.each do |finalist, vote_count|
      puts "#{finalist.name.yellow} got #{vote_count} votes."
    end
  end

  def announce_winner(final_votes)
    final_votes.each do |finalist, vote_count|
      if vote_count >= 4
        puts "#{finalist.name.red} won the Survivr Game!!!"
        return finalist
      end
    end
  end
end
