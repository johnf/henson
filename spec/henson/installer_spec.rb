require "spec_helper"

describe Henson::Installer do
  before do
    Henson.reset_settings
    Henson.settings[:puppetfile] = File.expand_path("spec/fixtures/Puppetfile")
  end

  context ".install!" do
    it "responds to .install!" do
      Henson::Installer.install!
    end
  end

  it "local! makes local setting true" do
    expect(Henson.settings[:local]).to_not be true
    Henson::Installer.local!
    expect(Henson.settings[:local]).to be true
  end

  it "no_cache! makes no_cache setting true" do
    expect(Henson.settings[:no_cache]).to_not be true
    Henson::Installer.no_cache!
    expect(Henson.settings[:no_cache]).to be true
  end

  it "clean! makes clean setting true" do
    expect(Henson.settings[:clean]).to_not be true
    Henson::Installer.clean!
    expect(Henson.settings[:clean]).to be true
  end
end
