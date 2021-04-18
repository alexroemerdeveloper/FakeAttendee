//
//  Counter.swift
//  FakeAttendee
//
//  Created by Alexander Römer on 13.04.21.
//

import Foundation
import Combine

protocol CounterProtocol {
    var isCounterStarted: Bool { get set }
    var timerInterval: Int { get set }
}

class Counter: ObservableObject, CounterProtocol, FakerProtocol {
    
    //CounterProtocol
    var timerInterval: Int = 30

    var isCounterStarted = false {
        didSet {
            if isCounterStarted {
                service.startClock(timeInterval: timerInterval)
            } else {
                service.stopClock()
            }
        }
    }
    
    
    //FakeManagerProtocol
    var event: AnyPublisher<Void, Never> {
        return clockEvent.eraseToAnyPublisher()
    }
    
    private let service            : ClockProtocol
    private let clockEvent         = PassthroughSubject<Void, Never>()
    private var clockSubscription  : Cancellable!
    
    init(service: ClockProtocol = Clock()) {
        self.service = service
        clockSubscription = service.clock.sink { completion in
            print("Clock completion: \(completion)")
        } receiveValue: { value in
            print(value)
            self.clockEvent.send()
        }
    }
    
}
