//
//  ChatScreenModel.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 27/07/21.
//

import Foundation

struct ChatScreenModel: Codable {
    let numberOfRecords: Int?
    let conversations: [ConversationModel]?
    let numberOfPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case numberOfRecords = "no_of_records"
        case numberOfPages = "no_of_pages"
        case conversations
    }
}

struct ConversationModel: Codable {
    let addedAt: Int?
    let addedBy: Int?
    let lastName: String?
    let id: Int?
    let message: String?
    let firstName: String?
    let addedAtText: String?
    
    enum CodingKeys: String, CodingKey {
        case addedAt = "added_at"
        case addedBy = "added_by"
        case lastName = "last_name"
        case id
        case message
        case firstName = "first_name"
        case addedAtText = "added_at_text"
    }
}
