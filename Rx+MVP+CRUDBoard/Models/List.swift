// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let list = try? JSONDecoder().decode(List.self, from: jsonData)

import Foundation

// MARK: - List
struct List: Codable {
    let list: [ListElement]
    let totalCount, code: Int
    let message: String?
}

// MARK: - ListElement
struct ListElement: Codable {
    let id: Int
    let title, description: String
    let yes24Link: String
    let publicationDate: Date
}
