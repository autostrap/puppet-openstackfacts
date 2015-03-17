Facter.add('nodetype') do
  setcode do
    require 'json'

    begin
    data = JSON.parse(IO.read('/config/openstack/latest/meta_data.json'))
    data['meta']['nodetype']
    rescue
      ''
    end
  end
end
