//
//  ViewModel.swift
//  FakeAttendee
//
//  Created by Alexander Römer on 13.04.21.
//

import Combine
import SwiftUI
import Foundation

protocol ViewModelProtocol: ObservableObject {
    var isCounterStarted: Bool { get set }
    var selection: [String] { get set }
}

class ViewModel: ViewModelProtocol {

    @Published var isCounterStarted: Bool = false
    @Published var selection: [String] = [0, 30].map { "\($0)" }
    
    private var model                     : CounterProtocol
    private var counterStartedSubscription: Cancellable!
    
    init(model: CounterProtocol, fakerModel: FakerProtocol) {
        self.model = model
        counterStartedSubscription = $isCounterStarted.removeDuplicates().sink(receiveValue: {
            if $0 {
                if let minutesAsInt = Int(self.selection[0]), let secondsAsInt = Int(self.selection[1]) {
                    let minutesInSeconds = minutesAsInt * 60
                    let totalSum = minutesInSeconds + secondsAsInt
                    self.model.timerInterval = totalSum
                }
            }
            self.model.isCounterStarted = $0
          }
        )
    }
    
    
}
