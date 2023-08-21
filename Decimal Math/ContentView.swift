//
//  ContentView.swift
//  Decimal Math
//
//  Created by Oleg Yakushin on 7/1/23.
//

import SwiftUI

struct ContentView: View {
    @State var isChatSelected: Bool = false
    @State var selectedChat: Chat?
    @State var isListViewVisible: Bool = false
    
    var body: some View {
       

               HSplitView {
                   LeftTabView(selectedChat: $selectedChat, isChatSelected: $isChatSelected)
                       .frame(minWidth: 300, idealWidth: 300)
                      
                   
                   ChatView(selectedChat: $isChatSelected, chat: $selectedChat)
                       .frame(minWidth: 700, idealWidth: 700)
                    
               }
               .overlay(
                           ListView(isVisible: $isListViewVisible)
                               .frame(width: 300, height: 300)
                       )
               .onAppear {
                   let keyK = NSEvent.ModifierFlags.command.rawValue
                   _ = NSEvent.ModifierFlags(rawValue: keyK)
                   NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
                       if (event.modifierFlags.rawValue & keyK) != 0 && event.charactersIgnoringModifiers?.lowercased() == "k" {
                           isListViewVisible.toggle()
                           return nil
                       }
                       if event.keyCode == 53 {
                                   isListViewVisible = false
                                   return nil
                               }
                       return event
                   }
               }
               .frame(minWidth: 1000, minHeight: 400)
       
       }
   }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
