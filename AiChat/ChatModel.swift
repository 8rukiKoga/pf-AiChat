//
//  ChatModel.swift
//  AiChat
//
//  Created by 古賀遥貴 on 2023/01/03.
//

import Foundation

struct Chat: Identifiable {
    var id = UUID()
    
    var isSentByUser: Bool
    var text: String
}
