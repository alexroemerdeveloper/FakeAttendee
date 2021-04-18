//
//  MultiPickerView.swift
//  FakeAttendee
//
//  Created by Alexander Römer on 15.04.21.
//

import SwiftUI

struct MultiPickerView: View  {

    typealias Label = String
    typealias Entry = String

    let data: [ (Label, [Entry]) ]
    
    @Binding var selection: [Entry]
    @Binding var isActive: Bool

    var body: some View {
//        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Do Every:")
                    .foregroundColor(.secondary)
                ForEach(0..<self.data.count) { column in
                    Picker(self.data[column].0, selection: self.$selection[column]) {
                        ForEach(0..<self.data[column].1.count) { row in
                            Text(verbatim: self.data[column].1[row])
                            .tag(self.data[column].1[row])
                        }
                    }
                    .disabled(isActive)
//                    .frame(width: geometry.size.width / CGFloat(self.data.count), height: geometry.size.height)
//                    .clipped()
                }
//            }
        }
    }
}

//struct MultiPickerView_Previews: PreviewProvider {
//    static var previews: some View {
////        MultiPickerView(data: <#[(MultiPickerView.Label, [MultiPickerView.Entry])]#>, selection: <#Binding<[MultiPickerView.Entry]>#>, isActive: <#Binding<Bool>#>)
//    }
//}
