apt_repository "silver-searcher" do
  uri          'http://ppa.launchpad.net/pgolm/the-silver-searcher'
  distribution node['lsb']['codename']
  components   ['main']
  keyserver    'hkp://keyserver.ubuntu.com:80'
  key          '841AB38C'
  action       :add
end

include_recipe "apt"

package "the-silver-searcher"
