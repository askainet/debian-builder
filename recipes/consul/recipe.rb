class Consul < FPM::Cookery::Recipe
  description 'tool for service discovery, monitoring and configuration'

  name     'consul'
  version  '0.7.0'
  homepage 'https://www.consul.io'
  source   "https://releases.hashicorp.com/consul/#{version}/consul_#{version}_linux_amd64.zip"
  sha256   'b350591af10d7d23514ebaa0565638539900cdb3aaa048f077217c4c46653dd8'

  section      'database'
  conflicts    'consul'

  def build
  end

  def install
    bin.install 'consul'

    etc('init.d').install_p workdir('consul.init'), 'consul'
    (etc/'init.d').install_p(workdir/'consul.init', 'consul')
    (etc/'consul.d').mkpath
  end
end
