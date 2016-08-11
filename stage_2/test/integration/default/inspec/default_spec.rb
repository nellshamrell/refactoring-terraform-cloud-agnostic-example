describe command('echo hello') do
  its('stdout') { should match (/hello/) }
end

describe command('lsblk') do
  its('stdout') { should match (/xvdh/) }
end

describe command('sudo file -s /dev/xvdh') do
  its('stdout') { should match('ext4') }
end

describe file('/data') do
  it { should be_directory }
end

describe command('lsblk') do
  its('stdout') { should match (/disk \/data/) }
end
