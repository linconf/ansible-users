# encoding: utf-8
# author: Chad Sheets

title 'System Users'

control 'users-01' do
  impact 1.0
  title 'users: Check home directory owner, group and permissions.'

  describe directory('/home/test-user') do
    it { should exist }
  end
end