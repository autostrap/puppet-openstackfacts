Facter.add('openstack_floating_ip') do
  setcode do
    require 'json'

    floatingip = nil

    begin
      data = JSON.parse(IO.read('/config/openstack/latest/meta_data.json'))
      floatingip = data['meta']['floating_ip']
    rescue
    end

    if ! floatingip
      floatingip = Facter.value(:ec2_public_ipv4)
    end
    floatingip
  end
end
