class Consul < FPM::Cookery::Recipe
  description 'tool for service discovery, monitoring and configuration'

  name     'consul'
  version  '0.7.0'
  homepage 'https://www.consul.io'
  source   "https://releases.hashicorp.com/consul/#{version}/consul_#{version}_linux_amd64.zip"
  sha256   'b350591af10d7d23514ebaa0565638539900cdb3aaa048f077217c4c46653dd8'

  section   'database'
  conflicts 'consul'

  post_install 'postinst'

  def build
  end

  def install
    bin.install 'consul'

    etc('consul.d').mkdir
    etc('systemd/system').install workdir('consul.service')
    etc('consul.d').install workdir('00.base.json')
    etc('default').install workdir('consul.default') => 'consul'
  end
end
