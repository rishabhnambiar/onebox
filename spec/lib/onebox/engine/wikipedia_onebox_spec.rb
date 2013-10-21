require "spec_helper"

describe Onebox::Engine::WikipediaOnebox do
  before(:all) do
    @link = "http://en.wikipedia.org/wiki/Kevin_Bacon"
    fake(@link, response(described_class.template_name))
  end
  before(:each) { Onebox.defaults.cache.clear }

  let(:onebox) { described_class.new(link) }
  let(:html) { onebox.to_html }
  let(:data) { onebox.send(:data) }
  let(:link) { @link }

  it_behaves_like "an engine"

  describe "#to_html" do
    it "has article image" do
      expect(html).to include("225px-Kevin_Bacon_Comic-Con_2012.jpg")
    end

    it "has the summary" do
      expect(html).to include("Kevin Norwood Bacon[1] (born July 8, 1958)")
    end
  end
end
