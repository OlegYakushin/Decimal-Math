//
//  ChatView.swift
//  Decimal Math
//
//  Created by Oleg Yakushin on 7/1/23.
//

import SwiftUI

struct ChatView: View {
    @State private var message = ""
    @Binding var selectedChat:Bool
    @Binding var chat: Chat?
    var body: some View {
        if selectedChat == false {
            ZStack{
                Color.white
                    .ignoresSafeArea()
                Text("Select chat to start")
                    .font(.custom("Helvetica", size:14))
                    
            }
        }
        else if let chat = chat {
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    HStack(spacing: 10){
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundColor(Color.clear)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color(hex: chat.accentColor) ?? .blue, Color.white]),
                                        startPoint: .center,
                                        endPoint: .top
                                    )
                                )
                                
                                .clipShape(Circle())
                            .overlay(
                                Text(String(chat.user.prefix(1)))
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )
                        VStack(alignment: .leading, spacing: 5){
                            Text(chat.user)
                                .font(.custom("Helvetica", size:14))
                                .bold()
                            Text("last seen 5 mins ago")
                                .font(.custom("Helvetica", size:12))
                                .foregroundColor(Color.gray)
                            
                        }
                        Spacer()
                        Image(systemName: "phone")
                            .font(Font.system(size: 20))
                        Image(systemName: "magnifyingglass")
                            .font(Font.system(size: 20))
                        Image(systemName: "ellipsis")
                            .font(Font.system(size: 20))
                        
                    }
                    
                    .padding(6)
                    
                    .frame(minWidth: 100, maxHeight: 50)
                    Divider()
                    Spacer()
                    
                    ScrollView {
                                       VStack {
                                         
                                           ForEach(chat.messages) { message in
                                               if message.sender == "You" {
                                                   MessageView(content: message.content, isYou: true)
                                               } else {
                                                   MessageView(content: message.content, isYou: false)
                                               }
                                           }
                                       }
                                   }
                    Divider()
                    HStack{
                        Button(action: {}) {
                            Image(systemName: "paperclip")
                                .font(Font.system(size: 20))
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        TextField("Message", text: $message)
                            .textFieldStyle(PlainTextFieldStyle())
                        Button(action: {}) {
                            Image(systemName: "face.smiling")
                                .font(Font.system(size: 20))
                        }
                        .buttonStyle(PlainButtonStyle())
                        if message == ""{
                            Button(action: {}) {
                                Image(systemName: "mic")
                                    .font(Font.system(size: 20))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }else{
                            Button(action: {
                                message = ""
                            }) {
                                Image(systemName: "paperplane")
                                    .font(Font.system(size: 20))
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                        }
                        }
                    
                    .padding()
                    .frame(minWidth: 100, maxHeight: 40)
                    
                }
            }
            
        }
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(selectedChat: .constant(true), chat: .constant(Chat.sampleData[0]))
    }
}
