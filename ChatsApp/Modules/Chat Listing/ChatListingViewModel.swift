//
//  ChatListingViewModel.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 24/07/21.
//

import Foundation

class ChatListingViewModel: DataModelProtocol {
    
    let baseDataController = BaseDataController()
    var chatListModel: ChatListModel?
    
    init(chatModel: ChatListModel?) {
        guard let chatModel = chatModel else { return }
        self.chatListModel =  chatModel
    }
    
    func fetchChatListing(success: @escaping (_ data: [ChatListingViewModel?]?,_ success: Bool) -> Void, failure: @escaping (_ error: String?) -> Void) {
        baseDataController.dataRequest(url: .fetchChatNameList, httpMethod: .get, parameters: nil, imageEndPoint: nil) { data, status in
            if status {
                let conversations = data?["conversations"] as? [Any] ?? []
                let dataArr = conversations.map {
                    return self.decode(dataDict: $0, ofType: ChatListModel.self)
                }
                let viewModelArr = dataArr.map {
                    return ChatListingViewModel(chatModel: $0)
                }
                success(viewModelArr, status)
            }
        } failure: { error in
            failure(error?.localizedDescription)
        }
    }
}

// MARK: - Computed Properties
extension ChatListingViewModel {
    
    var firstName: String {
        return chatListModel?.result?.contactFirstName ?? ""
    }
    
    var lastName: String {
        return chatListModel?.result?.contactLastName ?? ""
    }
    
    var addressLineOne: String {
        return chatListModel?.result?.contactAddLine1 ?? ""
    }
    
    var institutionName: String {
        return chatListModel?.result?.institutionName ?? ""
    }
    
    var district: String {
        return chatListModel?.result?.districtName ?? ""
    }
    
    var stateName: String {
        return chatListModel?.result?.stateName ?? ""
    }
    
    var zipCode: String {
        return chatListModel?.result?.contactZipCode ?? ""
    }
    
    var talukName: String {
        return chatListModel?.result?.talukName ?? ""
    }
    
    var cityName: String {
        return chatListModel?.result?.contactCity ?? ""
    }
}
