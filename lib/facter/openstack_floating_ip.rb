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
      begin
        data = JSON.parse(IO.read('/config/ec2/latest/meta-data.json'))
        floatingip = data['public-ipv4']
      rescue
        floatingip = Facter.value(:ec2_public_ipv4)
      end
    end
    floatingip
  end
end
