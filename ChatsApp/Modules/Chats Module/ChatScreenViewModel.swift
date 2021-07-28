//
//  ChatScreenViewModel.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 27/07/21.
//

import Foundation

class ChatScreenViewModel: DataModelProtocol {
    let baseDataController = BaseDataController()
    
    var conversationModel: ConversationModel?
    
    init(model: ConversationModel?) {
        self.conversationModel = model
    }
    
    func fetchChats(success: @escaping (_ data: [ChatScreenViewModel?]?,_ success: Bool) -> Void, failure: @escaping (_ error: String?) -> Void) {
        baseDataController.dataRequest(url: .fetchChats, httpMethod: .get, parameters: nil, imageEndPoint: nil) { data, status in
            if status {
                let dataArr = self.decode(dataDict: data, ofType: ChatScreenModel.self)
                let convModel = dataArr?.conversations
                guard let conModel = convModel else { return }
                let chatScreenVM = conModel.map {
                    return ChatScreenViewModel(model: $0)
                }
                
                success(chatScreenVM, status)
            }
        } failure: { error in
            failure(error?.localizedDescription)
        }
    }
}

// MARK: -  Computed Properties
extension ChatScreenViewModel {
    var firstName: String {
        return conversationModel?.firstName ?? ""
    }
    
    var lastName: String {
        return conversationModel?.lastName ?? ""
    }
    
    var message: String {
        return conversationModel?.message ?? ""
    }
    
    var dateTime: String {
        return conversationModel?.addedAtText ?? ""
    }
}
