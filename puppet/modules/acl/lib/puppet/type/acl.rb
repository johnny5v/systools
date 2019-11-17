Puppet::Type.newtype(:acl) do
    @doc = "acl"
    newparam(:path) do
        validate do |value|
            resource[:provider]= :acler
        end
        isnamevar
    end
    newproperty(:owner) do
       desc "The owner of the file."
       validate do |value|
           #notice 'something here'

       end
    end

    newproperty(:group) do
       desc "The owner of the file."
       validate do |value|
           #notice 'something here'
       end
    end

end

Puppet::Type.type(:acl).provide(:acler) do
    # notice "path=#{resource[:path]}"
    $owner_cur = nil
    $group_cur = nil

    def get_perms
        facl = `getfacl #{resource[:path]}`.gsub('#','').split()
        fi = facl.index('file:')
        oi = facl.index('owner:')
        gi = facl.index('group:')
        $owner_cur = facl[oi+1] 
        $group_cur = facl[gi+1] 
    end

    def owner
        get_perms
        owner_def = resource[:owner]
        unless $owner_cur == owner_def
            notice "changing owner current_value=#{$owner_cur}, should be #{owner_def}"
        end
        return owner_def
    end

    def group
        group_def = resource[:group]
        unless $group_cur == group_def
            notice "changing group current_value=#{$group_cur}, should be #{group_def}"
        end
        return group_def
    end    

end
