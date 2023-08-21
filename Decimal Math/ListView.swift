//
//  ListView.swift
//  Decimal Math
//
//  Created by Oleg Yakushin on 7/1/23.
//

import SwiftUI

struct ListView: View {
    @Binding var isVisible: Bool
    @State private var search = ""
    var body: some View {
        VStack(alignment: .leading){
            TextField("Where would you like to go?", text: $search)
                .font(Font.system(size: 14))
                .textFieldStyle(PlainTextFieldStyle())
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray.opacity(0.1))
                )
            ScrollView{
                VStack(alignment: .leading){
                    Text("PREVIOUS CHANNELS")
                        .font(Font.system(size: 12))
                        .padding()
                    HStack{
                     Text("proposal-ideas")
                            
                        Spacer()
                        }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity, maxHeight: 20)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.1))
                            
                    )
                    .padding(.horizontal)
                    HStack{
                     Text("V2 Testing")
                            
                        Spacer()
                        }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity, maxHeight: 20)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.1))
                            
                    )
                    .padding(.horizontal)
                    
                    
                    Text("DRAFTS")
                        .font(Font.system(size: 12))
                        .padding()
                    HStack{
                     Text("proposal-ideas")
                            
                        Spacer()
                        }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity, maxHeight: 20)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.1))
                            
                    )
                    .padding(.horizontal)
                    HStack{
                     Text("V2 Testing")
                            
                        Spacer()
                        }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity, maxHeight: 20)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.1))
                            
                    )
                    .padding(.horizontal)
                }
                
            }
        }
        .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 4)
                .opacity(isVisible ? 1 : 0)
                
        }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(isVisible: .constant(true))
    }
}
