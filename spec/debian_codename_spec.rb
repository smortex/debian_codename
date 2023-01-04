# frozen_string_literal: true

RSpec.describe DebianCodename do
  it 'can convert release number to codename' do
    expect(DebianCodename.fast_find('20.10')).to eq('groovy')
  end

  it 'can convert codename to release number' do
    expect(DebianCodename.fast_find('groovy')).to eq('20.10')
  end

  it 'throws DebianCodenameError when nothing is found' do
    expect { DebianCodename.fast_find('FOO!') }.to raise_error(DebianCodename::DebianCodenameError)
  end
end
