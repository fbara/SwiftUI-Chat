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
    // isMe will be true if We sent the message
    var isMe: Bool = false
}

// chatrow will be very similar to a cell in standard swift
struct ChatRow: View {
    // we will need to access and represent the chatMessages here
    var chatMessage: ChatMessage
    
    var body: some View {
        Group {
            //if the message is sent by the user, show it on the right side of the view
            if !chatMessage.isMe {
                HStack {
                    Text(chatMessage.avatar)
                    Text(chatMessage.message)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(chatMessage.color, cornerRadius: 10)
                    Spacer()
                }
            } else {
                // show the message on the left side of the view
                HStack {
                    Spacer()
                    Text(chatMessage.message)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(chatMessage.color, cornerRadius: 10)
                    Text(chatMessage.avatar)
                }
            }
        }
    }
}

struct ContentView: View {
    // @State here is necessary to make the composedMessage variable accessible from different views
    @State var composedMessage: String = ""
    @EnvironmentObject var chatController: ChatController
    
    // add some dummy values to the messages
    // suppose, there are only two messages in the chat room sent by two users: A and B
    // A sent "Hello world" with a red message bubble color
    // B sent "Hi" with a blue message color
    var messages = [
        ChatMessage(message: "Hello", avatar: "A", color: .red),
        ChatMessage(message: "Hi", avatar: "B", color: .blue)
    ]
    
    var body: some View {
        VStack {
            List {
                // we have several messages so we use the For Loop
                ForEach(messages, id: \.self) {
                    // then we just show the avatars of the users and their messages
                    // by using these two Text functions
                    ChatRow(chatMessage: $0)
                }
            }
            
            HStack {
                TextField($composedMessage, placeholder: Text("Message..."))
                    .frame(minHeight: 30)
                Button(action: sendMesage) {
                    Text("Send")
                }
            }.frame(height: 50)
                .padding()
        }
    }
    
    func sendMesage() {
        chatController.sendMessage((ChatMessage(message: composedMessage, avatar: "C", color: .green, isMe: true)))
        composedMessage = ""
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
