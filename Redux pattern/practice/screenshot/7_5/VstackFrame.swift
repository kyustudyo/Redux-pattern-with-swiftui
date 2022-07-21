//
//  MessageBubble.swift
//  ChatApp
//
//  Created by Stephanie Diep on 2022-01-11.
//

import SwiftUI

struct VstackFrame: View {
    var message: Message
    @State private var showTime = true
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color.gray : Color.pink)
                    .cornerRadius(30)
            }
//            .frame(maxWidth: 150, alignment: message.received ? .leading : .trailing)
            .background(.blue)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .foregroundColor(.black)
                    .font(.caption2)
                    
                    .padding(message.received ? .leading : .trailing, 25)
                    .background(.purple)
            }
        }
        
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .background(.gray)
        .padding(message.received ? .leading : .trailing)
        .background(.black)
        .padding(.horizontal, 10)
        .background(.yellow)
    }
}

struct VstackFrame_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
//            MessageBubble(message: Message(id: "12345", text: "I've been coding applications from scratch in SwiftUI and it's so much fun!", received: true, timestamp: Date()))
            VstackFrame(message: Message(id: "12345", text: "I've ", received: false, timestamp: Date()))
        }
        
            .background(.green)
    }
}


struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
