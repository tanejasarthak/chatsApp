//
//  ViewController.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 24/07/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtnOutlet: UIButton!
    
    // Public Properties
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnTap() {
        loginAPI()
    }
    
    func pushToChatVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let chatListingVC = storyboard.instantiateViewController(identifier: "ChatListingViewController") as! ChatListingViewController
        self.navigationController?.pushViewController(chatListingVC, animated: true)
    }
}

// MARK: - API Call
extension ViewController {
    func loginAPI() {
        viewModel.loginAPI() { data, status in
            if status {
                let accessToken = data?["access_token"] as? String ?? ""
                AppDelegate.appToken = accessToken
                self.pushToChatVC()
            }
        } failure: { error in
            print(error?.localizedDescription ?? "") // popup
        }

    }
}
