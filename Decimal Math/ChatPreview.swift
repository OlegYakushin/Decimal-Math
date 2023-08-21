//
//  ChatPreview.swift
//  Decimal Math
//
//  Created by Oleg Yakushin on 7/1/23.
//

import SwiftUI

struct ChatPreview: View {
    
    var title : String
   var message : String
  var unreadMessage : Int
    var date : Date
 var background : Color
    var accentColor : String
    var body: some View {
        HStack{
            
            
                           Circle()
                               .frame(width: 48, height: 48)
                               .foregroundColor(Color.clear)
                                   .background(
                                       LinearGradient(
                                           gradient: Gradient(colors: [Color(hex: accentColor) ?? .blue, Color.white]),
                                           startPoint: .center,
                                           endPoint: .top
                                       )
                                   )
                                   
                                   .clipShape(Circle())
                               .overlay(
                                   Text(String(title.prefix(1)))
                                       .font(.system(size: 24))
                                       .fontWeight(.bold)
                                       .foregroundColor(.white)
                               )
            
                       
            VStack(alignment: .leading){
                HStack{
                    Text(title)
                        .font(.custom("Helvetica", size:14))
                        .bold()
                    Spacer()
                    if Calendar.current.isDate(date, inSameDayAs: Date()){
                        Text(formatDate(date))
                            .font(.custom("Helvetica", size:12))
                            .foregroundColor(Color.gray)
                        
                    }else{
                        Text(date, format: .dateTime.day().month().year())
                            .font(.custom("Helvetica", size:12))
                            .foregroundColor(Color.gray)
                        
                    }
                    
                                             
                }
                .padding(.vertical, 1)
                HStack{
                    Text(message)
                        .font(.custom("Helvetica", size:12))
                        .foregroundColor(Color.gray)
                    Spacer()
                    if unreadMessage > 0 {
                                            Text("\(unreadMessage)")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                                .padding(6)
                                                .background(Color.blue)
                                                .clipShape(Circle())
                                        }
                }
            }
        }
        .padding(.horizontal)
        
        .frame(minHeight: 70, maxHeight: 80)
       
        .background(background)
        
        
    }
    private func formatDate(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: date)
        }
}

struct ChatPreview_Previews: PreviewProvider {
    static var previews: some View {
        ChatPreview(title: "Chat 1", message: "I miss you", unreadMessage: 2, date: Date(), background: Color.white, accentColor: "FF0000")
    }
}
