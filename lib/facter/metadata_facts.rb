# This file contains all facts that can be retrieved as-is from cloud-init
# metadata. Just add the metadata keys to the array at the top.
['nodetype',
 'cloudname'
 'stack_name',
 'sshkeys'].each { |factname|
    Facter.add(factname) do
      setcode do
        require 'json'

        begin
          data = JSON.parse(IO.read('/config/openstack/latest/meta_data.json'))
          data['meta'][factname]
        rescue
          ''
        end
      end
    end
 }
