Facter.add('openstack_floating_ip') do
  setcode do
    require 'json'

    data = JSON.parse(IO.read('/config/openstack/latest/meta_data.json'))
    begin
      data['meta']['floating_ip']
    rescue
      'false'
    end
  end
end
