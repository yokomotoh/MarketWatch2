//
//  SearchBar.swift
//  Green4all
//
//  Created by Mounir DJIAR on 18/03/2021.
//

import SwiftUI

struct SearchBarYoko: View {
    
    @Binding var searchText:String
    
    @State private var isEditing : Bool = false
    
    var body: some View {
        HStack {
            TextField("Rechercher ...", text: $searchText)
                .padding(8)
                .padding(.horizontal, 25)
                //.foregroundColor(colorForeGroundGreenDark) // opacity: 0.37 for clear // Uses UIColor)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            //.foregroundColor(colorForeGroundGreenDark)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            clearButton
                        }
                    }
                )
                
                .onChange(of: searchText , perform: { value in
                    self.isEditing = (searchText != "")
                })
        }
        //.background(Color(red: 44/255, green: 171/255, blue: 130/255, opacity: 0.37)) // opacity: 0.37 for clear // Uses UIColorColor.white.opacity(0.9))
        .background(colorTranparent)
        .background(Color(.systemGray4))
        .cornerRadius(5.0)
        .padding(.horizontal) 
    }
}

extension SearchBarYoko {
    
    private var clearButton : some View {
        Button(action: {
            self.isEditing = false
            self.searchText = ""
        }) {
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(Color(.systemGray4))
                .padding(8)
        }
    }
}

struct SearchBarYoko_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarYoko(searchText: .constant(""))
    }
}
