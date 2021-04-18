//
//  ContentView.swift
//  FakeAttendee
//
//  Created by Alexander Römer on 13.04.21.
//

import SwiftUI
import Foundation

struct ContentView<Model: ViewModelProtocol>: View {
    
    @EnvironmentObject var viewModel: Model
    
    @State private var data: [(String, [String])] = [
        ("minutes", Array(0...60).map { "\($0)" }),
        ("seconds", Array(1...60).map { "\($0)" })
    ]
            
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(isCounterStarted: $viewModel.isCounterStarted)
            .frame(maxWidth: .infinity)
            MultiPickerView(data: data, selection: $viewModel.selection, isActive: $viewModel.isCounterStarted)
                .padding(.bottom)
        }
        .padding()
        .background(Color("ColorBackground"))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView<FakeViewModel>().environmentObject(FakeViewModel(value: 123, isCounterStarted: true))
                .previewDisplayName("ON 123")
            ContentView<FakeViewModel>().environmentObject(FakeViewModel(value: 456, isCounterStarted: false))
                .previewDisplayName("OFF 456")
        }
    }
}

