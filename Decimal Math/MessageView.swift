//
//  MessageView.swift
//  Decimal Math
//
//  Created by Oleg Yakushin on 7/2/23.
//

import SwiftUI

struct MessageView: View {
    let content: String
    let isYou: Bool
    let timestamp = Date()
    var body: some View {
        HStack {
                   if isYou {
                       Spacer()
                       VStack(alignment: .trailing, spacing: 2) {
                                          Text(content)
                                              
                                          Text(formatDate(timestamp))
                                              .font(.caption)
                                             
                                      }
                           .padding(5)
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(10)
                   } else {
                       VStack(alignment: .trailing, spacing: 2) {
                                          Text(content)
                                              
                                          Text(formatDate(timestamp))
                                              .font(.caption)
                                              .foregroundColor(.gray)
                                      }
                       
                       .padding(8)
                       .background(Color.gray.opacity(0.2))
                       .cornerRadius(10)
                                      Spacer()
                   }
               }
               .padding(.horizontal)
    }
    private func formatDate(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: date)
        }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(content: "My dear friend", isYou: false)
    }
}
