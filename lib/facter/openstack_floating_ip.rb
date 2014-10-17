Facter.add('openstack_floating_ip') do
  setcode do
    require 'json'

    begin
    data = JSON.parse(IO.read('/config/openstack/latest/meta_data.json'))
    data['meta']['floating_ip']
    rescue
      ''
    end
  end
end
