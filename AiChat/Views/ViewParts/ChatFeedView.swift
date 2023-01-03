//
//  ChatFeedView.swift
//  AiChat
//
//  Created by 古賀遥貴 on 2023/01/03.
//

import SwiftUI

struct ChatFeedView: View {
    
    var chats: [Chat]
    
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(chats) { remark in
                    BubbleView(remark: remark)
                }
            }
        }
        .padding()
        
    }
}

struct ChatFeedView_Previews: PreviewProvider {
    static var previews: some View {
        ChatFeedView(chats: [
            Chat(isSentByUser: true, text: "こんにちは"),
            Chat(isSentByUser: true, text: "あなたの名前はなんですか？"),
            Chat(isSentByUser: false, text: "Meboです。😄")
        ])
    }
}
