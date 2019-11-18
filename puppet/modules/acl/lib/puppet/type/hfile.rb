Puppet::Type.newtype(:hfile) do
    @doc = "hfile"
    ensurable
    newparam(:path) do
        validate do |value|
            resource[:provider]= :hfiler
        end
        isnamevar
    end    
end

Puppet::Type.type(:hfile).provide(:hfiler) do
    def create
        system 'mkdir','-p',resource[:path]
    end

    def destroy
        system 'rm','-rf',resource[:path]
    end

    def exists?
        path_exists = system "test","-d",resource[:path]
    end
end
