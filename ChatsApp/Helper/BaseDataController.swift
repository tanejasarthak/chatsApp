//
//  BaseDataController.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 24/07/21.
//

import Foundation
import Alamofire

struct BaseDataController {
    func dataRequest(url: EndPointUrl?, httpMethod: HTTPMethod, parameters: [String: Any]?, imageEndPoint: String?, success: @escaping (_ data: [String: Any]?,_ success: Bool) -> Void, failure: @escaping (_ error: AFError?) -> Void) {
        let completeURL = baseUrl + (url?.rawValue ?? "")
            
        let httpHeaders : HTTPHeaders = [
            "Access-Token": AppDelegate.appToken,
            "x-api-key" : xApiKey
        ]
        var successStatus = true
        debugPrint("url=", completeURL)
        debugPrint("parameters= ", parameters)
        debugPrint("headers= ", httpHeaders)
        
        AF.request(completeURL, method: httpMethod, parameters: httpMethod == .post ? parameters : nil, encoding: JSONEncoding.default, headers: httpHeaders, interceptor: nil, requestModifier: nil)
            .responseJSON { response in
                switch response.result {
                    case .success(let value):
                        debugPrint(value)
                        let val = value as? [String: Any]
                      //  let data = val?["access_token"] as? String
//                        let data = val?["data"] as? [String: Any]
                        successStatus = val?["status"] as? Bool ?? true
                        success(val, successStatus)
                case .failure(let error):
                      //  debugPrint(error.localizedDescription)
                       failure(error)
                }
            }
    }
}
