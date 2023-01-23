# frozen_string_literal: true

module DebianCodename
  class DebianCodenameError < StandardError; end

  # Codenames need to be all lower case
  DEBIAN_CODENAMES = {
    '14' => %w[forky],
    '13' => %w[trixie],
    '12' => %w[bookworm],
    '11' => %w[bullseye],
    '10' => %w[buster],
    '9' => %w[stretch],
    '8' => %w[jessie],
    '7' => %w[wheezy],
    '6.0' => %w[squeeze],
    '5.0' => %w[lenny],
    '4.0' => %w[etch],
    '3.1' => %w[sarge],
    '3.0' => %w[woody],
    '2.2' => %w[potato],
    '2.1' => %w[slink],
    '2.0' => %w[hamm],
    '1.3' => %w[bo],
    '1.2' => %w[rex],
    '1.1' => %w[buzz]
  }.freeze

  UBUNTU_CODENAMES = {
    '23.04' => %w[lunar lobster],
    '20.10' => %w[groovy gorilla],
    '20.04' => %w[focal fossa],
    '19.10' => %w[eoan ermine],
    '19.04' => %w[disco dingo],
    '18.10' => %w[cosmic cuttlefish],
    '18.04' => %w[bionic beaver],
    '17.10' => %w[artful aardvark],
    '17.04' => %w[zesty zapus],
    '16.10' => %w[yakkety yak],
    '16.04' => %w[xenial xerus],
    '15.10' => %w[wily werewolf],
    '15.04' => %w[vivid vervet],
    '14.10' => %w[utopic unicorn],
    '14.04' => %w[trusty tahr],
    '13.10' => %w[saucy salamander],
    '13.05' => %w[raring ringtail],
    '12.10' => %w[quantal quetzal],
    '12.04' => %w[precise pangolin],
    '11.10' => %w[oneiric ocelot],
    '11.04' => %w[natty narwhal],
    '10.10' => %w[maverick meerkat],
    '10.04' => %w[lucid lynx],
    '9.10' => %w[karmic koala],
    '9.04' => %w[jaunty jackalope],
    '8.10' => %w[intrepid ibex],
    '8.04' => %w[hardy heron],
    '7.10' => %w[gutsy gibbon],
    '7.04' => %w[feisty fawn],
    '6.10' => %w[edgy eft],
    '6.06' => %w[dapper drake],
    '5.10' => %w[breezy badger],
    '5.04' => %w[hoary hedgehog],
    '4.10' => %w[warty warthog]
  }.freeze

  module_function

  # Convert from version string to codename and vice versa
  def fast_find(user_search_string)
    search_string = user_search_string.downcase

    [DEBIAN_CODENAMES, UBUNTU_CODENAMES].each do |code_catalog|
      return codename(code_catalog, search_string) if code_catalog.key?(search_string)

      version_found = code_catalog.find { |_, value| value[0] == search_string }
      return version_found.first unless version_found.nil?
    end

    raise DebianCodenameError, 'No match'
  end

  # Return a canonical form (Hash with ':version' and ':codename' keys)
  def find(user_search_string)
    search_string = user_search_string.downcase

    [DEBIAN_CODENAMES, UBUNTU_CODENAMES].each do |code_catalog|
      if code_catalog.key?(search_string)
        return {
          version: search_string,
          codename: codename(code_catalog, search_string)
        }
      end

      version_found = code_catalog.find { |_, value| value[0] == search_string }
      unless version_found.nil?
        return {
          version: version_found.first,
          codename: search_string
        }
      end
    end

    raise DebianCodenameError, 'No match'
  end

  def codename(code_catalog, version_string)
    code_catalog[version_string][0]
  end
end
