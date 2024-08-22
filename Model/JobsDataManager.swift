//
//  JobsDataManager.swift
//  TeamBlue
//
//  Created by Gcode on 8/13/24.
//

import Foundation

struct JobsDataManager: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var location: String
    var description: String
    var pay: String
    var jobType: String
    var benefits: [String]?
    var requirements: String
    var category: String
    var image: String
    var applicationStatus: ApplicationStatus // New property
}

import Foundation
import Combine
import SwiftUI

var jobs: [JobsDataManager] = load("Jobs.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find (filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load (filename) from main bundle:\n(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse (filename) as (T.self):\n(error)")
        
    }
}


enum ApplicationStatus: String, CaseIterable, Identifiable, Codable {
    case notApplied = "Not Applied"
    case applied = "Applied"
    case interview = "Interview"
    case offer = "Offer"
    case hired = "Hired"
    case rejected = "Rejected"

    var id: String { rawValue }

    var color: Color {
        switch self {
        case .notApplied:
            return .blue
        case .applied:
            return .gray
        case .interview:
            return .yellow
        case .offer:
            return .orange
        case .hired:
            return .green
        case .rejected:
            return .red
        }
    }

    var progress: Double {
        switch self {
        case .notApplied:
            return 0.1
        case .applied:
            return 0.3
        case .interview:
            return 0.5
        case .offer:
            return 0.7
        case .hired:
            return 0.8
        case .rejected:
            return 1.0
        }
    }
}
