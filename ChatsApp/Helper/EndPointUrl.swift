//
//  EndPointUrl.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 24/07/21.
//

import Foundation

enum EndPointUrl: String {
    case login = "user/login?username=dcpuofficer&password=admin" // POST
    case fetchChats = "cci/1/conversation?records_per_page=20&current_page=1" //
    case sendMessage = "cci/1/conversation" // POST
    case fetchChatNameList = "cci/1/conversation/poll/-1"
}

