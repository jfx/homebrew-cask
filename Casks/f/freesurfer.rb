cask "freesurfer" do
  arch arm: "arm64", intel: "x86_64"

  version "8.2.0"
  sha256 "9a2514589db567b4c47740207494a30b4276aa2a1327f065466ba3ee2886a324"

  url "https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/#{version}/freesurfer-macOS-darwin_#{arch}-#{version}.pkg"
  name "FreeSurfer"
  desc "Software suite for processing and analyzing brain MRI images"
  homepage "https://surfer.nmr.mgh.harvard.edu/"

  livecheck do
    url "https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/"
    regex(%r{href=["']?v?(\d+(?:\.\d+)+)/?["' >]}i)
  end

  depends_on :macos

  pkg "freesurfer-macOS-darwin_#{arch}-#{version}.pkg"

  uninstall pkgutil: "org.freesurfer.*"

  zap trash: "~/Library/Preferences/edu.harvard.mgh.nmr.FreeView.plist"

  caveats do
    requires_rosetta
    free_license "https://surfer.nmr.mgh.harvard.edu/registration.html"
  end
end
