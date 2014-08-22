require "spec_helper"

describe Henson::Settings do
  context "initialize" do
    it "defaults quiet to false" do
      expect(Henson::Settings.new[:quiet]).to be false
    end

    it "defaults verbose to false" do
      expect(Henson::Settings.new[:verbose]).to be false
    end

    it "defaults puppetfile to Puppetfile" do
      puppetfile = "#{Dir.pwd}/Puppetfile"
      expect(Henson::Settings.new[:puppetfile]).to eq(puppetfile)
    end

    it "defaults path to shared" do
      shared = "#{Dir.pwd}/shared"
      expect(Henson::Settings.new[:path]).to eq(shared)
    end

    it "accepts a hash that will override the defaults" do
      # TODO Are we happy with this test being truth and not checking the hash
      expect(Henson::Settings.new(:quiet => true)).to be_truthy
    end
  end

  context "[]" do
    it "delegates to fetch" do
      instance = Henson::Settings.new
      expect(instance["foo"]).to be_nil
      instance["foo"] = :bar
      expect(instance["foo"]).to eq(:bar)
    end
  end
end
