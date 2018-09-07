class Secret_Diary
  attr_reader :locked

  def initialize(password)
    diary = Diary.new(password)
    @diary_entries = []
  end

  def add_entry(entry)
    fail "Sorry, the diary is currently locked" if diary.locked
    @diary_entries << entry
  end

  def get_entries
    fail "Sorry, the diary is currently locked" if diary.locked
    @diary_entries.each{|entry| puts entry}
  end
end

class Diary
  attr_reader :locked

  def initialize(password)
    @locked = true
    @password = password
  end

  def lock(password)
    fail "That's the wrong password" unless @password == password
    @locked = true
  end

  def unlock(password)
    fail "That is the wrong password" unless @password == password
    @locked = false
  end
end
