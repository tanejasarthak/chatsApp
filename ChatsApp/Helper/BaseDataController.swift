//
//  BaseDataController.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 24/07/21.
//

import Foundation

struct BaseDataController {
    func dataRequest(url: EndPointUrl?, parameters: [String: Any]?, imageEndPoint: String?, authHeaders: String?, success: @escaping (_ data: [String: Any]?,_ success: Bool) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        let completeURL = baseUrl + (url?.rawValue ?? "")
        
        let httpHeaders: HTTPHeaders = [.authorization(authHeaders ?? "")]
        var successStatus = true
        debugPrint("url=", completeURL)
        debugPrint(parameters)
        debugPrint(httpHeaders)
        
        AF.request(completeURL, method: httpMethod, parameters: httpMethod == .post ? parameters : nil, encoding: JSONEncoding.default, headers: httpHeaders, interceptor: nil, requestModifier: nil)
            .responseJSON { response in
                switch response.result {
                    case .success(let value):
                        debugPrint(value)
                        let val = value as? [String: Any]
                        let data = val?["data"] as? [String: Any]
                        successStatus = val?["success"] as? Bool ?? true
                        success(data, successStatus)
                case .failure(let error):
                      //  debugPrint(error.localizedDescription)
                       failure(error)
                }
            }
    }
}
