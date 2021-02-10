//
//  TestViewController.swift
//  Istsharat
//
//  Created by taima on 2/5/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import SwiftyJSON
import DZNEmptyDataSet


struct Sender: SenderType {
    
    var senderId: String
    var displayName: String
}

struct MyMessage: MessageType {
    
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
    
}

class TestViewController: MessagesViewController {
    
    var chatId: Int = 4
    var preVc = ""
    var catID = 0
    let currentUser = Sender(senderId: "\(UserProfile.shared.userID ?? 0)", displayName: UserProfile.shared.ar_name ?? "" )
        
    var messages: [MessageType] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configurCollectionView()
        setupData()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        fetchData()
    }
    
    @IBAction func btnSideMenu(_ sender: Any) {
        self.toggleRightView(self)
    }
}


extension TestViewController {
    func setupData(){
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        messagesCollectionView.emptyDataSetSource = self
        messagesCollectionView.emptyDataSetDelegate = self
    }
    
    // MARK: - configureMessagesCollectionView
    func configurCollectionView(){
        messageInputBar.inputTextView.becomeFirstResponder()
        messageInputBar.contentView.backgroundColor = "Color".myColor
        inputAccessoryView?.backgroundColor = "Color".myColor
        messageInputBar.sendButton.title = ""
        messageInputBar.sendButton.setImage("goArrow".image_, for: .normal)
        messageInputBar.inputTextView.font = Constant.shared.ProjectFont.toFont(size: 17)
        messageInputBar.inputTextView.textColor = .white
        messageInputBar.separatorLine.isHidden = true
        messageInputBar.inputTextView.textContainerInset.bottom = 0
        messageInputBar.inputTextView.layer.cornerRadius = 10
        messageInputBar.inputTextView.layer.masksToBounds = true
        messageInputBar.setLeftStackViewWidthConstant(to: 40, animated: false)
        messageInputBar.sendButton.contentEdgeInsets = UIEdgeInsets(top: 2, left: 13, bottom: 2, right: 2)
        messageInputBar.setStackViewItems([messageInputBar.sendButton], forStack: .left, animated: false)
        messageInputBar.inputTextView.placeholder = ""
        messageInputBar.middleContentViewPadding.right = 0
        
    }
    
    func kind(_ text: String, _ color: UIColor = .white) -> MessageKind {
        let font = Constant.shared.ProjectFont.toFont(size: 17)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color,
        ]
        
        let attributed = NSAttributedString.init(string: text, attributes: attributes)
        return .attributedText(attributed)
    }
}

extension TestViewController: MessagesDataSource {
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        messages.count
    }
    
}

extension TestViewController: MessagesLayoutDelegate {
    
}

extension TestViewController: MessagesDisplayDelegate {
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return message.sender.senderId == "\(UserProfile.shared.userID ?? 0)" ? "Color".myColor : "lineColor".myColor
    }
}

extension TestViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        messages.append(MyMessage(sender: currentUser, messageId: UUID().uuidString, sentDate: Date(), kind: kind(text)))
        self.messagesCollectionView.reloadData()
        messageInputBar.inputTextView.text = ""
        sendMessage(text)
    }

}


extension TestViewController {
    
    // MARK: - fetch messages
    func fetchData(){
        if self.preVc == "fromConsultationVC" {
            requestChat()
            return
        }
        self.preVc = ""
        getMessages()
    }
    
    
    func getMessages () {
        setMessageToread()
        let request = BaseRequest()
        let userId = UserProfile.shared.userID ?? 0
        let type = UserProfile.shared.userType ?? 0
        request.url = "ListMessages?u_id=\(userId)&u_type=\(type)&chat_id=\(self.chatId)&page=0"
        request.method = .get
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (json) in
            let data = ListMessagesModel.init(fromJson: JSON(json.object))
            if data.success {
                //self.showErrorAlert(message: data.message)
                self.messages.removeAll()
                if let messages = data.messages {
                    for message in messages {
                        if let senderId = message.senderId,
                           let messageId = message.msgId,
                            let date = message.createdAt,
                           let messageBody = message.message{
                            let txtColor: UIColor = "\(senderId)" == self.currentUser.senderId ? .white : "FontColor".myColor
                            let sender = Sender(senderId: "\(senderId)", displayName: "")
                            self.messages.append(MyMessage(sender: sender, messageId: "\(messageId)", sentDate: date.toDate(customFormat: "yyyy-MM-dd'T'HH:mm:ssZ"),kind: self.kind(messageBody,txtColor)))
                        }
                    }
                    self.messages.sort {
                        $0.sentDate > $1.sentDate
                    }
                }
                self.messagesCollectionView.reloadData()
                return
            }
            print(data)
        }
    }
    
    
    func requestChat() {
        let userId = UserProfile.shared.userID ?? 0
        let type = UserProfile.shared.userType ?? 0
        let dic = [
            "chat_session": "\(self.chatId)",
            "u_type": "\(type)",
            "u_id": "\(userId)",
            "category": "\(self.catID)",
            "customer_id": ""
        ]
        let request = BaseRequest()
        request.url = "RequestChat"
        request.method = .post
        request.parameters = dic
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request,showLoader: false) { (json) in
            let data = GeneralResponseModel.init(fromJson: JSON(json.object))
            if !data.success {
                self.showErrorAlert(message: data.message)
                return
            }
            print(data)
        }
    }
    
    
    

    
    // MARK: - sendMessage
    func sendMessage(_ message: String) {
        let userId = UserProfile.shared.userID ?? 0
        let type = UserProfile.shared.userType ?? 0
        let dic = [
            "chat_session": "\(self.chatId)",
            "u_type": "\(type)",
            "u_id": "\(userId)",
            "message": message
        ]
        let request = BaseRequest()
        request.url = "SendMessage"
        request.method = .post
        request.parameters = dic
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request,showLoader: false) { (json) in
            let data = GeneralResponseModel.init(fromJson: JSON(json.object))
            if !data.success {
                self.showErrorAlert(message: data.message)
                return
            }
            print(data)
        }
    }
    
    func setMessageToread() {
        let request = BaseRequest()
        let userId = UserProfile.shared.userID ?? 0
        request.url = "SetToRead?u_id=\(userId)&chat_id=\(self.chatId)&u_type=0"
        request.method = .get
        RequestBuilder.requestWithSuccessfullRespnose(request: request, showLoader: false) { (json) in
           // let data = GeneralResponseModel.init(fromJson: JSON(json.object))
            print("")
        }
    }
}


// MARK: - emptyDataSet

extension TestViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
   func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
       return #imageLiteral(resourceName: "emptyTable") ?? UIImage()
   }
   
   func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
    return NSAttributedString.init(string: "لاتوجد رسائل", attributes:    [NSAttributedString.Key.font : Constant.shared.ProjectFont.toFont(size: 20) ?? .systemFont(ofSize: 15),    NSAttributedString.Key.foregroundColor: "color".myColor])
   }
   
}


