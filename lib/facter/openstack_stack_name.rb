Facter.add('openstack_stack_name') do
  setcode do
    require 'json'

    begin
    data = JSON.parse(IO.read('/config/openstack/latest/meta_data.json'))
    data['meta']['stack_name']
    rescue
      ''
    end
  end
end
