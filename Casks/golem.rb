cask 'golem' do
  name 'Golem Worldwide Supercomputer GUI'
  homepage 'https://github.com/golemfactory/golem-electron/'

  version '0.1.14'
  sha256 '05265d99c048d895a53e3581e26a9fee4f53c38a837f57c039775fdfba2b2393'
  url "https://github.com/golemfactory/golem-electron/releases/download/#{version.major_minor_patch}/golem-electron-macos-#{version.major_minor_patch}.dmg"

  auto_updates true
  depends_on formula: 'golemfactory/golem/golem'
  depends_on cask: 'golem-mainnet-launcher'
  depends_on cask: 'docker'

  app 'golem.app'

  # Creates a symlink for the newly installed 'docker' binary
  FileUtils.ln_sf "/Applications/Docker.app/Contents/Resources/bin/docker", "/usr/local/bin/docker"
  # Removes the symlink on deinstallation
  uninstall delete: "/usr/local/bin/docker"
end
