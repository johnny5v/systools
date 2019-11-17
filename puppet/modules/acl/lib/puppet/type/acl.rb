Puppet::Type.newtype(:acl) do
    @doc = "acl"
    ensurable
    newparam(:path) do
        validate do |value|
            resource[:provider]= :acler
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

Puppet::Type.type(:acl).provide(:acler) do

    def create
        unless $owner_match then
            system 'chown',resource[:owner],resource[:path]
        end
        unless $group_match then
            system 'chgrp',resource[:group],resource[:path]
        end
    end

    def destroy
        notice "in destroy"
    end

    def exists?
        path_def = resource[:path]
        mode_def = resource[:mode]
        owner_def = resource[:owner]
        group_def = resource[:group]
        
        facl = `getfacl #{resource[:path]}`.gsub('#','').split()
        fi = facl.index('file:')
        oi = facl.index('owner:')
        gi = facl.index('group:')
        owner_cur = facl[oi+1]
        group_cur = facl[gi+1]
        
        $owner_match = owner_cur == owner_def
        $group_match = group_cur == group_def
        all_match = $owner_match && $group_match

    end
end
