//
//  LoginViewModel.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 24/07/21.
//

import Foundation
import Alamofire

class LoginViewModel {
    let baseDataController = BaseDataController()
    
//    func validateTextFields(username: String, password: String) -> (status: Bool, message: String) {
//        if username == "" {
//            return (false, "enter username")
//        } else if password == "" {
//            return (false, "enter password")
//        }
//        return (true, "")
//    }
    
    func loginAPI(success: @escaping (_ data: [String: Any]?,_ success: Bool) -> Void, failure: @escaping (_ error: AFError?) -> Void) {
        baseDataController.dataRequest(url: .login, httpMethod: .post, parameters: [:], imageEndPoint: nil) { data, status in
            if status {
                success(data, status)
            }
        } failure: { error in
            failure(error)
        }

    }
}
