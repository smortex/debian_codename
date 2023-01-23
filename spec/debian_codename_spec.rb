# frozen_string_literal: true

RSpec.describe DebianCodename do
  it 'can convert version string to codename' do
    expect(DebianCodename.fast_find('20.10')).to eq('groovy')
  end

  it 'can convert codename to version string' do
    expect(DebianCodename.fast_find('groovy')).to eq('20.10')
  end

  it 'can convert codename to canonical form' do
    expect(DebianCodename.find('groovy')).to eq({ version: '20.10', codename: 'groovy' })
  end

  it 'can convert version string to canonical form' do
    expect(DebianCodename.find('20.10')).to eq({ version: '20.10', codename: 'groovy' })
  end

  it 'throws DebianCodenameError when nothing is found' do
    expect { DebianCodename.fast_find('FOO!') }.to raise_error(DebianCodename::DebianCodenameError)
  end
end
