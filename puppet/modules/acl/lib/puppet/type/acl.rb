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
    $path_exists = nil
    $staus_msg = nil

    def get_perms
        $path_exists = system "test -d #{resource[:path]}"
        unless $path_exists
            return
        end
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
        $staus_msg = @resource.noop ? "should be" : "setting to be"
        unless $path_exists
            return $owner_cur
        end        
        unless $owner_cur == owner_def
            notice "changing owner current_value=#{$owner_cur}, #{$staus_msg} #{owner_def}"
            unless @resource.noop
                system "chown #{owner_def} #{resource[:path]}"
            end
        end
        return owner_def
    end

    def group
        group_def = resource[:group]
        unless $path_exists
            return $group_cur
        end        
        unless $group_cur == group_def
            notice "changing group current_value=#{$group_cur},#{$staus_msg} #{group_def}"
            unless @resource.noop
                system "chgrp #{group_def} #{resource[:path]}"
            end
        end
        return group_def
    end    

end
