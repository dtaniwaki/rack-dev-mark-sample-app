require 'spec_helper'
require 'serverspec'
require 'docker'
require 'net/http'
require 'digest'

describe 'Dockerfile' do
  before :all do
    @rack_dev_mark_env="env-#{$PID}"
    system "RACK_DEV_MARK_ENV=#{@rack_dev_mark_env} docker-compose up -d web"
    sleep 3

    container = Docker::Container.get('rackdevmarksampleapp_web_1')

    set :backend, :docker
    set :docker_container, container.id
  end

  after :all do
    `docker-compose stop web`
  end

  describe command('curl http://localhost:8080/') do
    its(:exit_status) { is_expected.to eq 0 }
    its(:stdout) { is_expected.to contain @rack_dev_mark_env }
  end
end
