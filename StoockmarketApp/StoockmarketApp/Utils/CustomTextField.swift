//
//  CustomTextField.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 12/12/22.
//

import SwiftUI

struct CustomTextField: View {
  
    var placeHolder : Text
        @Binding var text : String
        var editingChanged : (Bool) ->  Void  = { _ in }
        var commit : () -> Void = {}
        
    
    var body : some View {
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeHolder
            }
            TextField("", text: $text , onEditingChanged:  editingChanged, onCommit:  commit)
        }
    }
}
