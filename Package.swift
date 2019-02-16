// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "DarkSky",
    products: [.library(name: "DarkSky", targets: ["DarkSky"])],
    targets: [.target(name: "DarkSky", path: "DarkSky")]
)
