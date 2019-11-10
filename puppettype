Puppet::Type.newtype(:repo) do
@doc = "Manage repos"
   ensurable
   newparam(:source) do
      desc "The repo source"

      validate do |value|
          resource[:provider] = :git
      end
      isnamevar
   end

   newparam(:path) do
      desc "Destination path"
      validate do |value|
         unless value =~ /^\/[a-z0-9]+/
            raise ArgumentError , "%s is not a valid file path" % value
         end
      end
   end
end

Puppet::Type.type(:repo).provide(:git) do
   desc "GIT Support"
   commands :git => "git"
   def create
      git "clone", resource[:name], resource[:path]
   end

   def destroy
      FileUtils.rm_rf resource[:path]
   end

   def exists?
      system "ls -d #{resource[:path]}"
   end
end
