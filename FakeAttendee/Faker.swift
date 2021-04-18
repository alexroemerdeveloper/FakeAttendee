//
//  Faker.swift
//  FakeAttendee
//
//  Created by Alexander Römer on 15.04.21.
//

import Foundation
import Combine


protocol FakerProtocol {
    var event: AnyPublisher<Void, Never> { get }
}

typealias CGDirectDisplayID = UInt32

class Faker: ObservableObject {
    
    private let event              : FakerProtocol
    private var eventSubscription  : Cancellable!
    
    
    private let points: [CGPoint]

    init(model: FakerProtocol) {
        let points = (0...50).map { (value) in
            return CGPoint(x: Int.random(in: 100..<350), y: Int.random(in: 100..<350))
        }
        self.points = points
        self.event = model
        eventSubscription = event.event.sink { completion in
            print("Clock completion: \(completion)")
        } receiveValue: { value in
            print(value)
            self.moveCursor(onDisplay: self.mainDisplayID(), toPoint: self.points.randomElement()!)
        }
    }
    
    private func mainDisplayID() -> CGDirectDisplayID {
        return CGMainDisplayID()
    }
    
    private func moveCursor(onDisplay display: CGDirectDisplayID, toPoint point: CGPoint) {
        print(point)
        CGDisplayMoveCursorToPoint(display, point)
    }
    
    
    
}
