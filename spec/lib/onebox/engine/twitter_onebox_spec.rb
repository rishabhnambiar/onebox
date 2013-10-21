require "spec_helper"

describe Onebox::Engine::TwitterOnebox do
  before(:all) do
    @link = "https://twitter.com/toastergrrl/status/363116819147538433"
    fake(@link, response(described_class.template_name))
  end
  before(:each) { Onebox.defaults.cache.clear }

  let(:onebox) { described_class.new(link) }
  let(:html) { onebox.to_html }
  let(:data) { onebox.send(:data) }
  let(:link) { @link }

  it_behaves_like "an engine"

  describe "#to_html" do
    it "has tweet" do
      expect(html).to include("I&#39;m a sucker for pledges.")
    end

    it "has timestamp" do
      expect(html).to include("6:59 PM - 1 Aug 13")
    end

    it "has username" do
      expect(html).to include("@toastergrrl")
    end

    it "has user avatar" do
      expect(html).to include("39b969d32a10b2437563e246708c8f9d_normal.jpeg")
    end

    it "has tweet favorite count" do
      pending
      expect(html).to include("")
    end

    it "has retweet count" do
      pending
      expect(html).to include("")
    end
  end
end
