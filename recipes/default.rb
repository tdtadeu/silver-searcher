include_recipe "apt"

def setup_ag
  install_dependencies

  download_ag_repository

  install_ag
end

def install_dependencies
  package "automake"
  package "pkg-config"
  package "libpcre3-dev"
  package "zlib1g-dev"
  package "liblzma-dev"
end

def download_ag_repository
  git "Checkout Code" do
    repository "git://github.com/ggreer/the_silver_searcher.git"
    reference "master"
    action :checkout
    destination "/usr/local/src/the_silver_searcher"
  end
end

def install_ag
  bash "install silver searcher" do
    cwd "/usr/local/src/the_silver_searcher"
    code <<-EOH
      PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig ./build.sh &&
      make install
    EOH
    creates "/usr/local/bin/ag"
  end
end

setup_ag
