
describe command('lsb_release --description --short') do
  its('stdout') { should match 'Ubuntu 14.04.5 LTS' }
end

describe service('postgresql') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe command('ruby --version') do
  its('stdout') { should match 'ruby 2.1' }
end

describe port(22) do
  its('processes') { should include 'sshd' }
  its('protocols') { should include 'tcp' }
  its('addresses') { should include '0.0.0.0' }
end

describe host('localhost', port: 80, protocol: 'tcp') do
  it { should be_reachable }
end

