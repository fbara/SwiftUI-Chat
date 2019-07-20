//
//  ChatController.swift
//  SwiftUI Chat
//
//  Created by Frank Bara on 7/19/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//
/*
 This is a bridge between older Swift code/file and SwiftUI.
 */

import Combine
import SwiftUI

// ChatController needs to be a BindableObject in order to be accessible by SwiftUI
class ChatController: BindableObject {
    var willChange = PassthroughSubject<Void, Never>()
    //var didChange = PassthroughSubject<Void, Never>()
    
    // We've relocated the messages from the main SwiftUI View.
    // Now, if you wish, you can handle the networking part here and populate this array with any data from your database.
    var messages = [
            ChatMessage(message: "Hello", avatar: "A", color: .red),
            ChatMessage(message: "Hi", avatar: "B", color: .blue)
    ]
    
    // this function will be accessible from SwiftUI main view.
    // here you can add the necessary code to send your messages not only to the SwiftUI view,
    // but also to the database so that other users of the app would be able to see it
    func sendMessage(_ chatMessage: ChatMessage) {
        // populate the messages array
        messages.append(chatMessage)
        // let the SwiftUI know that we need to rebuild the views
        willChange.send(())
        //didChange.send(())
    }
}
