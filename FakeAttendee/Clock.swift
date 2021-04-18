//
//  Clock.swift
//  FakeAttendee
//
//  Created by Alexander Römer on 13.04.21.
//

import Foundation
import Combine

enum ClockError: Error {
    case invalid
}

protocol ClockProtocol {
    var clock: AnyPublisher<Date, ClockError> { get }
    func startClock(timeInterval: Int)
    func stopClock()
}

class Clock: ClockProtocol {

    var clock: AnyPublisher<Date, ClockError> {
        return clockMulticaster.eraseToAnyPublisher()
    }
    
    private let clockMulticaster = PassthroughSubject<Date, ClockError>()
    private var timerSubscription: Cancellable?
    
    func startClock(timeInterval: Int) {
        print(timeInterval)
        timerSubscription = Timer.publish(every: TimeInterval(timeInterval), on: .main, in: .default)
            .autoconnect()
            .setFailureType(to: ClockError.self)
            .multicast(subject: clockMulticaster)
            .connect()
    }
    
    func stopClock() {
        timerSubscription?.cancel()
    }
}
