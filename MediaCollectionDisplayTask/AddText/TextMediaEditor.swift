//
//  TextEditor.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 28/04/2021.
//

import SwiftUI

struct TextMediaEditor: View {
    @Binding var textEditorMessage: String
    
    var body: some View {
        TextEditor(text: _textEditorMessage)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .foregroundColor(Color("TextEditorAndCellForeground"))
            .background(Color("TextEditorAndCellBkgrd"))
            .font(.custom("HelveticaNeue", size: 20))
            .lineSpacing(5)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("TextEditorAndCellForeground"), lineWidth: 2)
            )   
    }
}

//struct TextMediaEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        TextMediaEditor()
//    }
//}
