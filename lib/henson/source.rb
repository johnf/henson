require "henson/source/generic"

require "henson/source/forge"
require "henson/source/git"
require "henson/source/github"
require "henson/source/path"

module Henson
  module Source
    def self.infer_from_opts(name, requirement, opts = {})
      if path = opts.delete(:path)
        Path.new name, path
      elsif git = opts.delete(:git)
        Git.new name, git, opts
      elsif forge = opts.delete(:forge)
        Forge.new name, requirement, forge
      elsif github = opts.delete(:github) || opts.delete(:github_tarball)
        GitHub.new name, requirement, github
      end
    end
  end
end
