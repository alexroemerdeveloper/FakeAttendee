//
//  HeaderView.swift
//  FakeAttendee
//
//  Created by Alexander Römer on 15.04.21.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var isCounterStarted: Bool
    
    @State private var isHovering: Bool = false
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Start Faker")
            Spacer()
            Toggle("", isOn: $isCounterStarted)
                .toggleStyle(SwitchToggleStyle(tint: .green))
                .padding(.bottom, 16)
                .scaleEffect(isHovering ? 1.15 : 1)
                .animation(.easeInOut)
                .onHover(perform: { hovering in
                    withAnimation {
                        isHovering = hovering
                    }
                })
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(isCounterStarted: .constant(true))
    }
}
