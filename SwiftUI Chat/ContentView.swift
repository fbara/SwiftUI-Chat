//
//  ContentView.swift
//  SwiftUI Chat
//
//  Created by Frank Bara on 7/19/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

// structure that will represent each message in chat
struct ChatMessage: Hashable {
    var message: String
    var avatar: String
}

struct ContentView: View {
    
    // add some dummy values to the messages
    // suppose, there are only two messages in the chat room sent by two users: A and B
    // A sent "Hello world" with a red message bubble color
    // B sent "Hi" with a blue message color
    var messages = [
        ChatMessage(message: "Hello", avatar: "A"),
        ChatMessage(message: "Hi", avatar: "B")
    ]
    
    var body: some View {
        List {
            // we have several messages so we use the For Loop
            ForEach(messages, id: \.self) {
                // then we just show the avatars of the users and their messages
                // by using these two Text functions
                Text($0.avatar)
                Text($0.message)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
