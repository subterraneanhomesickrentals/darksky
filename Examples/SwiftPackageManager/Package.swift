// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Weather",
    dependencies: [.package(path: "../../")],
    targets: [.target(name: "Weather", dependencies: ["DarkSky"], path: "")]
)
