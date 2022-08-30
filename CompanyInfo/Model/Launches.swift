//
//  Launches.swift
//  CompanyInfo
//
//  Created by Kavya on 29/08/22.
//

import Foundation
public let launchURL = "https://api.spacexdata.com/v4/launches"
// MARK: - WelcomeElement
struct Launches: Codable {
    let fairings: Fairings?
    let links: Link?
    let static_fire_date_utc: String?
    let static_fire_date_unix: Int?
    let net: Bool?
    let window: Int?
    let rocket: String?
    let success: Bool?
    let failures: [Failure]?
    let details: String?
    let crew, ships, capsules: [String]?
    let payloads: [String]?
    let launchpad: String?
    let flight_number: Int?
    let name, date_utc: String?
    let date_unix: Int?
    let date_local: String?
    let date_precision: String?
    let upcoming: Bool?
    let cores: [Core]?
    let auto_update, tbd: Bool?
    let launch_library_id: String?
    let id: String?
}

// MARK: - Core
struct Core: Codable {
    var core: String?
    var flight: Int?
    var gridfins, legs, reused, landing_attempt: Bool?
    var landing_success: Bool?
    var landing_type, landpad : String?
}

// MARK: - Failure
struct Failure: Codable {
    var time: Int?
    var altitude: Int?
    var reason: String?
}

// MARK: - Fairings
struct Fairings: Codable {
    var reused, recovery_attempt, recovered: Bool?
    var ships: [String]?
}

// MARK: - Links
struct Link: Codable {
    var patch: Patch?
    var reddit: Reddit?
    var flickr: Flickr?
    var presskit: String?
    var webcast: String?
    var youtube_id: String?
    var article: String?
    var wikipedia: String?
}

// MARK: - Flickr
struct Flickr: Codable {
    var small, original: [String]?
}

// MARK: - Patch
struct Patch: Codable {
    var small, large: String?
}

// MARK: - Reddit
struct Reddit: Codable {
    var campaign, launch, media, recovery: String?
}

