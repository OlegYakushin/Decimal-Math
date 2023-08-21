//
//  LeftTabView.swift
//  Decimal Math
//
//  Created by Oleg Yakushin on 7/1/23.
//

import SwiftUI

struct LeftTabView: View {
    @State private var search = ""

    @State private var chats = Chat.sampleData.sorted(by: { $0.lastMessageDate > $1.lastMessageDate })
    @Binding var selectedChat: Chat?
    @Binding var isChatSelected:Bool
    @State private var selectedIcon: String = "message"
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack{
                HStack{
                  
                        TextField("􀊫 Search", text: $search)
                            .font(Font.system(size: 14))
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.gray.opacity(0.1))
                            )
                           
                            
                    
                    Button(action: {}) {
                        Image(systemName: "square.and.pencil")
                            .font(Font.system(size: 16))
                        
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
            
             
                
                ScrollView{
                   
                    VStack(spacing:0){
                        Divider()
                        ForEach(chats) { chat in
                           
                               
                            ChatPreview(title: chat.user,message: chat.lastMessageText,
                               unreadMessage: chat.unreadCount,
                                        date: chat.lastMessageDate, background: chat.id == selectedChat?.id ? Color.blue.opacity(0.2) : Color.white, accentColor: chat.accentColor)
                                
                                    .onTapGesture {
                                        isChatSelected = true
                                        selectedChat = chat
                                        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
                                                        chats[index].unreadCount = 0
                                                    }
                                        
                                    }
                            Divider()
                            }
                           
                               
                           
                                                }
                   
                       
                    
                       
                        
                    }
                .padding(.vertical, -15)
                    
                  
                
                Divider()
                HStack{
                    Spacer()
                                       Button(action: {
                                           selectedIcon = "message"
                                       }) {
                                           Image(systemName: "message")
                                               .font(Font.system(size: 20))
                                               .foregroundColor(selectedIcon == "message" ? .blue : .black)
                                       }
                                       .buttonStyle(PlainButtonStyle())
                                       
                                       Spacer()
                                       
                                       Button(action: {
                                           selectedIcon = "gear"
                                       }) {
                                           Image(systemName: "gear")
                                               .font(Font.system(size: 20))
                                               .foregroundColor(selectedIcon == "gear" ? .blue : .black)
                                       }
                                       .buttonStyle(PlainButtonStyle())
                    Spacer()
                                   }
                                   .padding()
                .frame(maxHeight: 40)
                
                
                
            }
        }
      
    }
}

struct LeftTabView_Previews: PreviewProvider {
    static var previews: some View {
        LeftTabView(selectedChat: .constant(Chat.sampleData[0]),isChatSelected: .constant(false))
    }
}
