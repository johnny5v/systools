Puppet::Type.newtype(:acl) do
    @doc = "acl"
    ensurable
    newparam(:path) do
        validate do |value|
            resource[:provider]= :ruby
        end
        isnamevar
    end

    newparam(:mode) do
       desc "acl"
       validate do |value|
           #resource[:provider] = :myacl
       end
    end

    newparam(:owner) do
       desc "acl"
       validate do |value|
           #resource[:provider] = :myacl
       end
    end
    newparam(:group) do
       desc "acl"
       validate do |value|
           #resource[:provider] = :myacl
       end
    end
    
end

Puppet::Type.type(:acl).provide(:ruby) do
    $path_exists = nil
    $owner_match = nil
    $group_match = nil

    def create
        if $path_exists then
            unless $owner_match then
                system 'chown',resource[:owner],resource[:path]
            end
            unless $group_match then
                system 'chgrp',resource[:group],resource[:path]
            end
        else
            system 'mkdir','-p',resource[:path]
            system "chown #{resource[:owner]}:#{resource[:group]} #{resource[:path]}"
        end
    end

    def destroy
        notice "in destroy"
    end

    def exists?
        path_def = resource[:path]
        mode_def = resource[:mode]
        owner_def = resource[:owner]
        group_def = resource[:owner]
        notice "path = #{resource[:path]}"
        $path_exists = system "ls","-d",resource[:path]
        
        if $path_exists then
            facl = `getfacl #{resource[:path]}`.gsub('#','').split()
            fi = facl.index('file:')
            oi = facl.index('owner:')
            gi = facl.index('group:')
            owner_cur = facl[oi+1]
            group_cur = facl[gi+1]
            
            $owner_match = owner_cur == owner_def
            $group_match = group_cur == group_def
            all_match = $owner_match and $group_match
            return all_match
        else
            return false
        end
                

    end
end
