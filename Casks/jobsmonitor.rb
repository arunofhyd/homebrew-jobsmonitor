cask "jobsmonitor" do
  version "2.3.5"
  sha256 "1f947eb10da756c6d677c73ba04a3c5e1f24ba0703944e575d32f9c1e779db2c"

  url "https://github.com/arunofhyd/JobsMonitor/releases/download/v#{version}/JobsMonitor.zip"
  name "Jobs Monitor"
  desc "Native macOS menu bar app for Apple job postings"
  homepage "https://github.com/arunofhyd/JobsMonitor"

  livecheck do
    url "https://raw.githubusercontent.com/arunofhyd/JobsMonitor/main/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :monterey"

  app "JobsMonitor.app"

  uninstall quit:      "com.aoh.jobsmonitor",
            launchctl: "com.aoh.jobsmonitor"

  zap trash: [
    "~/Library/Application Support/JobsMonitor",
    "~/Library/Logs/JobsMonitor",
    "~/Library/Preferences/com.aoh.jobsmonitor.plist",
  ]
end
