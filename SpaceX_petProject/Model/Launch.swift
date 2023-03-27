//
//  Launch.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 25.03.2023.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let launch = try? JSONDecoder().decode(Launch.self, from: jsonData)

import Foundation

// MARK: - LaunchElement
struct Launch: Codable {
//    let fairings: Fairings?
//    let links: Links
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let net: Bool
    let window: Int?
//    let rocket: Rocket
    let success: Bool?
//    let failures: [Failure]
    let details: String?
    let crew, ships, capsules, payloads: [String]
//    let launchpad: Launchpad
    let flightNumber: Int
    let name: String
//    let dateUTC: Date
    let dateLocal: Date
//    let datePrecision: DatePrecision
    let upcoming: Bool
    let cores: [Core]
    let autoUpdate, tbd: Bool
    let launchLibraryID: String?
    let id: String
}

// MARK: - Core
struct Core: Codable {
    let core: String?
    let flight: Int?
    let gridfins, legs, reused, landingAttempt: Bool?
    let landingSuccess: Bool?

}


// MARK: - Fairings
struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: Bool?
    let ships: [String]


}

//// MARK: - Links
//struct Links: Codable {
//    let patch: Patch
//    let reddit: Reddit
//    let flickr: Flickr
//    let presskit: String?
//    let webcast: String?
//    let youtubeID: String?
//    let article: String?
//    let wikipedia: String?
//
//}

// MARK: - Flickr
struct Flickr: Codable {
    let original: [String]
}

// MARK: - Patch
struct Patch: Codable {
    let small, large: String?
}

