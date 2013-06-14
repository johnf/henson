require "spec_helper"

describe Henson::Installer do
  let(:ui)     { mock }

  before do
    Henson.reset_settings
    Henson.settings[:puppetfile] = File.expand_path("spec/fixtures/Puppetfile")

    Henson.stubs(:ui).returns(ui)
    ui.stub(:debug)
    ui.stub(:success)
  end

  after do
    Henson.unstub(:ui)
  end

  context ".install!" do
    it "responds to .install!" do
      File.stub(:open).with(anything(), "w").and_return(StringIO.new)

      Henson::Installer.install!

      File.unstub(:open)
    end
  end

  it "local! makes local setting true" do
    expect(Henson.settings[:local]).to_not be_true
    Henson::Installer.local!
    expect(Henson.settings[:local]).to be_true
  end

  it "no_cache! makes no_cache setting true" do
    expect(Henson.settings[:no_cache]).to_not be_true
    Henson::Installer.no_cache!
    expect(Henson.settings[:no_cache]).to be_true
  end

  it "clean! makes clean setting true" do
    expect(Henson.settings[:clean]).to_not be_true
    Henson::Installer.clean!
    expect(Henson.settings[:clean]).to be_true
  end
end
