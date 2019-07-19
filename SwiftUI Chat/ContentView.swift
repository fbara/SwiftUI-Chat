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
    var color: Color
}

// chatrow will be very similar to a cell in standard swift
struct ChatRow: View {
    // we will need to access and represent the chatMessages here
    var chatMessage: ChatMessage
    
    var body: some View {
        HStack {
            Text(chatMessage.avatar)
            Text(chatMessage.message)
            .bold()
            .foregroundColor(Color.white)
            .padding(10)
            .background(chatMessage.color, cornerRadius: 10)
        }
    }
}

struct ContentView: View {
    
    // add some dummy values to the messages
    // suppose, there are only two messages in the chat room sent by two users: A and B
    // A sent "Hello world" with a red message bubble color
    // B sent "Hi" with a blue message color
    var messages = [
        ChatMessage(message: "Hello", avatar: "A", color: .red),
        ChatMessage(message: "Hi", avatar: "B", color: .blue)
    ]
    
    var body: some View {
        List {
            // we have several messages so we use the For Loop
            ForEach(messages, id: \.self) {
                // then we just show the avatars of the users and their messages
                // by using these two Text functions
                ChatRow(chatMessage: $0)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(ChatController())
    }
}
#endif
