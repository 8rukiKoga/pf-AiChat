//
//  BubbleView.swift
//  AiChat
//
//  Created by 古賀遥貴 on 2023/01/03.
//

import SwiftUI

struct BubbleView: View {
    
    var remark: Chat
    
    var body: some View {
        
        if remark.isSentByUser {
            HStack {
                Spacer()
                VStack {
                    Text(remark.text)
                }
                .padding()
                .background(RoundedCorners(color: Color(.systemBrown), tl: 26, tr: 26, bl: 26, br: 2))
            }
        } else {
            HStack {
                VStack {
                    Text(remark.text)
                }
                .padding()
                .background(RoundedCorners(color: Color(.systemGray5), tl: 26, tr: 26, bl: 2, br: 26))
                Spacer()
            }
        }
        
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(remark: Chat(isSentByUser: true, text: "こんにちは"))
    }
}
