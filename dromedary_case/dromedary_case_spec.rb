# frozen_string_literal: true

require "rspec"
require_relative "dromedary_case"

RSpec.describe String do
  describe "#dromedary_case" do
    context "with readme examples" do
      it { expect("i am a nice dromedary".dromedary_case).to be_eql("iamaniceDromedary") }
      it { expect("camelus-dromedarius for you".dromedary_case).to be_eql("camelusDromedariusforyou") }
      it { expect("hump".dromedary_case).to be_eql("huMp") }
      it { expect("you can't find 3 humps camels".dromedary_case).to be_eql("youcantfind3humpscamels") }
      it { expect("%%%% **** $$$$".dromedary_case).to be_eql("dromEdary") }
    end
  end
end
