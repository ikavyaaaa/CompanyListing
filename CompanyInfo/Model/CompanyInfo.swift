//
//  Welcome.swift
//  CompanyInfo
//
//  Created by Kavya on 29/08/22.
//

import Foundation
public let companyURL = "https://api.spacexdata.com/v4/company"
// MARK: - Welcome
struct CompanyInfo: Codable {
    let headquarters: Headquarters?
    let links: Links?
    let name, founder: String?
    let founded, employees, vehicles, launch_sites: Int?
    let testSites: Int?
    let ceo, cto, coo, ctoPropulsion: String?
    let valuation: Int?
    let summary, id: String?
}

// MARK: - Headquarters
struct Headquarters: Codable {
    var address, city, state: String?
}

// MARK: - Links
struct Links: Codable {
    var website, flickr, twitter, elonTwitter: String?
}

