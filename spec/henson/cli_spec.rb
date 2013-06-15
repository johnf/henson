require "spec_helper"
require "henson/cli"

describe Henson::CLI do
  before do
    Henson.reset_settings
    Henson.settings[:puppetfile] = File.expand_path("spec/fixtures/Puppetfile")
  end

  it "is a subclass of Thor" do
    expect(Henson::CLI.new).to be_a(Thor)
  end

  context "start" do
    before do
      ENV["HENSON_PUPPETFILE"] = File.expand_path("/path/to/nowhere")
    end

    after do
      ENV["HENSON_PUPPETFILE"] = nil
    end

    it "responds to start, provided by Thor" do
      expect(Henson::CLI).to respond_to(:start)
    end

    it "ENV['HENSON_PUPPETFILE'] sets settings[:puppetfile]" do
      Henson::CLI.new
      expect(Henson.settings[:puppetfile]).to eq("/path/to/nowhere")
    end
  end

  context "install" do
    before do
      Henson::Installer.stubs(:install!)
    end

    after do
      Henson::Installer.unstub(:install!)
    end

    context "options" do
      it "sets local if --local" do
        silence_warnings { ARGV = ["install", "--local"] }
        Henson::CLI.start
        expect(Henson.settings[:local]).to be_true
      end

      it "sets no_cache if --no-cache" do
        silence_warnings { ARGV = ["install", "--no-cache"] }
        Henson::CLI.start
        expect(Henson.settings[:no_cache]).to be_true
      end

      it "sets clean if --clean" do
        silence_warnings { ARGV = ["install", "--clean"] }
        Henson::CLI.start
        expect(Henson.settings[:clean]).to be_true
      end

      it "sets path if --path" do
        silence_warnings { ARGV = ["install", "--path", "spec/fixtures/shared"] }
        Henson::CLI.start
        expect(Henson.settings[:path]).to eq("spec/fixtures/shared")
      end
    end
  end
end
