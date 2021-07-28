//
//  ChatScreenViewController.swift
//  ChatsApp
//
//  Created by Sarthak Taneja on 24/07/21.
//

import UIKit

class ChatScreenViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var chatScreenTableView: UITableView!
    @IBOutlet weak var chatTextField: UITextField!
    
    let viewModel = ChatScreenViewModel(model: nil)
    var dataSource: [ChatScreenViewModel?]?
    var timer: Timer?
    var counter = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureTableView()
        fetchChatList()
    }
    
    @IBAction func sendButtonTap() {
        guard let message = chatTextField.text else { return }
        let convModel = ConversationModel(addedAt: nil, addedBy: nil, lastName: nil, id: nil, message: message, firstName: nil, addedAtText: "\(Date())")
        let chatScreenVM = ChatScreenViewModel(model: convModel)
        dataSource?.append(chatScreenVM)
        
        DispatchQueue.main.async {
            self.chatScreenTableView.reloadData()
        }
    }
    
    func configureTableView() {
        chatScreenTableView.delegate = self
        chatScreenTableView.dataSource = self
        chatScreenTableView.tableFooterView = UIView()
        
        chatScreenTableView.register(UINib(nibName: "ChatScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatScreenTableViewCell")
    }
}

extension ChatScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatScreenTableViewCell", for: indexPath) as! ChatScreenTableViewCell
        cell.configureCells(model: dataSource?[indexPath.row])
        return cell
    }
}

// MARK: - API Call
extension ChatScreenViewController {
    func fetchChatList() {
        viewModel.fetchChats { data, status in
            self.dataSource = data
            
            DispatchQueue.main.async {
                self.chatScreenTableView.reloadData()
            }
            self.startTimer()
        } failure: { error in
            
        }
    }
}

extension ChatScreenViewController {
    fileprivate func startTimer() {
        counter = 60
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    fileprivate func invalidateTimer() {
        if let timer = timer, timer.isValid {
            timer.invalidate()
        }
        self.timer = nil
        fetchChatList()
    }
    
    @objc fileprivate func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            invalidateTimer()
        }
    }
}
