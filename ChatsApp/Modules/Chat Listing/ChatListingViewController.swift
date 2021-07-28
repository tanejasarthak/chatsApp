//
//  ChatListingViewController.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 24/07/21.
//

import UIKit

class ChatListingViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var chatListTableView: UITableView!
    
    // Public Properties
    var viewModel = ChatListingViewModel(chatModel: nil)
    var recordsList: [ChatListingViewModel?]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureTableView()
        fetchChatList()
    }
    
    func configureTableView() {
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        
        chatListTableView.register(UINib(nibName: "ChatListTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatListTableViewCell")
    }
    
    func pushToChatScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let chatScreenVc = storyboard.instantiateViewController(identifier: "ChatScreenViewController") as! ChatScreenViewController
        self.navigationController?.pushViewController(chatScreenVc, animated: true)
    }
}

// MARK: - TableView Delegate and Datasource
extension ChatListingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListTableViewCell", for: indexPath) as! ChatListTableViewCell
        cell.configureCell(model: recordsList?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pushToChatScreen()
    }
}

// MARK: - API Call
extension ChatListingViewController {
    func fetchChatList() {
        viewModel.fetchChatListing { data, status in
            if status {
                self.recordsList = data
                DispatchQueue.main.async {
                    self.chatListTableView.reloadData()
                }
            }
        } failure: { error in
            print(error)
        }
    }
}
