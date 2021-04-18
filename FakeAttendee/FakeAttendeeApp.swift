//
//  FakeAttendeeApp.swift
//  FakeAttendee
//
//  Created by Alexander Römer on 13.04.21.
//

import SwiftUI

@main
struct FakeAttendeeApp: App {
    
    
    @StateObject private var counterObject: Counter
    @StateObject private var faker: Faker
    
    var body: some Scene {
        WindowGroup {
            ContentView<ViewModel>().environmentObject(ViewModel(model: counterObject, fakerModel: counterObject))
                .frame(width: 200)
        }
    }
    
    init() {
        let counter = Counter()
        _counterObject = StateObject(wrappedValue: counter)
        
        let faker = Faker(model: counter)
        _faker = StateObject(wrappedValue: faker)
    }
}
