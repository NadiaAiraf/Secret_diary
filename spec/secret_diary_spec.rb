require 'secret_diary'

describe Secret_Diary do
  it 'throws an error if you try to get entries when the diary is locked' do
    diary = Secret_Diary.new('password')
    expect{diary.get_entries}.to raise_error('Sorry, the diary is currently locked')
  end
  it 'throws an error if you try to add entry when diary is locked' do
    diary = Secret_Diary.new('password')
    expect{diary.get_entries}.to raise_error('Sorry, the diary is currently locked')
  end
  it 'returns error when you try to unlock it with a different password' do
    diary = Secret_Diary.new('password')
    expect{diary.unlock('not the password')}.to raise_error('That is the wrong password')
  end
  it 'expects get_entries to return an array of entries when unlocked' do
    diary = Secret_Diary.new('password')
    diary.unlock('password')
    expect(diary.get_entries).to be_a_kind_of(Array)
  end
  it 'expects add_entry to return an array of entries when unlocked' do
    diary = Secret_Diary.new('password')
    diary.unlock('password')
    diary.add_entry('aoigjaoi')
    diary.add_entry('aeirgegv')
    expect(diary.add_entry('hello')).to be_a_kind_of(Array)
  end
  it 'expects it to tell you it is locked after unlocking then locking again and trying to get entries or add entries' do
    diary = Secret_Diary.new('pass')
    diary.unlock('pass')
    diary.lock('pass')
    expect{diary.get_entries}.to raise_error('Sorry, the diary is currently locked')
    expect{diary.add_entry('hello')}.to raise_error('Sorry, the diary is currently locked')
  end

end
