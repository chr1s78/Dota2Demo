//
//  DotaTeamModel.swift
//  Dota2Demo
//
//  Created by Chr1s on 2021/9/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dota2Team = try? newJSONDecoder().decode(Dota2Team.self, from: jsonData)

import Foundation

// MARK: - Dota2TeamElement
struct Dota2TeamElement: Codable, Hashable {
   // let teamID: Int?
   // let rating: Double?
  //  let wins, losses, lastMatchTime: Int?
    let name, tag: String?
    let logoURL: String?

    enum CodingKeys: String, CodingKey {
   //     case teamID = "team_id"
   //     case rating, wins, losses
   //     case lastMatchTime = "last_match_time"
        case name, tag
        case logoURL = "logo_url"
    }
}

typealias Dota2Team = [Dota2TeamElement]
