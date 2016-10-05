# encoding: utf-8
# author: Chad Sheets

title 'System Users'

control 'users-01' do
  impact 1.0
  title 'users | test-user-1'
  describe user('test-user-1') do
    it { should exist }
    its('uid') { should eq 1010 }
    its('group') { should eq 'test-user-1-primary-group' }
    its('groups') { should eq ['test-user-1-primary-group', 'test-user-1-secondary-group']}
    its('home') { should eq '/home/test-user-1' }
    its('shell') { should eq '/bin/bash' }
  end
end

control 'users-02' do
  impact 1.0
  title 'users | test-user-2'
  describe user('test-user-2') do
    it { should exist }
    its('group') { should eq 'test-user-2' }
    its('home') { should eq '/opt/users/homedir/test-user-2' }
    its('shell') { should eq '/bin/sh' }
  end
end

control 'users-03' do
  impact 1.0
  title 'users | test-user-3'
  describe user('test-user-3') do
    it { should_not exist }
  end
end

control 'users-04' do
  impact 1.0
  title 'users | group-to-remove'
  describe group('group-to-remove') do
    it { should_not exist }
  end
end