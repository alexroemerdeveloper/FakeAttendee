//
//  FakeViewModel.swift
//  FakeAttendee
//
//  Created by Alexander Römer on 13.04.21.
//

import Foundation
import Combine

class FakeViewModel: ViewModelProtocol {
    
    @Published var isCounterStarted: Bool
    @Published var selection: [String] = [0, 30].map { "\($0)" }
    
    init(value: Int, isCounterStarted: Bool) {
        self.isCounterStarted = isCounterStarted
    }

}
