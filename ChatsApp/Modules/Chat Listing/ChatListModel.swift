//
//  ChatListModel.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 26/07/21.
//

import Foundation

struct ChatListModel: Codable {
    let id: Int?
    let result: CCIModel?
    
    enum CodingKeys: String, CodingKey {
        case id
        case result = "cci"
    }
}

struct CCIModel: Codable {
    let stateName: String?
    let contactFirstName: String?
    let contactLastName: String?
    let contactAddLine1: String?
    let contactZipCode: String?
    let districtName: String?
    let addressLine2: String?
    let institutionName: String?
    let contactCity: String?
    let talukName: String?
    
    enum CodingKeys: String, CodingKey {
        case stateName = "state_name"
        case contactFirstName = "contact_first_name"
        case contactLastName = "contact_last_name"
        case contactAddLine1 = "contact_address_line1"
        case contactZipCode = "contact_zipcode"
        case districtName = "district_name"
        case institutionName = "institution_name"
        case contactCity = "contact_city"
        case talukName = "taluk_name"
        case addressLine2
    }
}
/*
 state_name
 contact_first_name
 "contact_zipcode
 "contact_address_line1":"#123",
 "contact_last_name":"Charles",
 institution_name
 "district_name":"Chennai",
 "address_line2":"Sanjeevi street, Neru Nagar, Arumbakkam",
 "address_line1":"#123",
 "country_name":"India",
 */
