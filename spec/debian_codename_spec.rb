# frozen_string_literal: true

RSpec.describe DebianCodename do
  it "has a version number" do
    expect(DebianCodename::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
