import UIKit
import Combine

class EvenSubject<Failure: Error>: Subject {
    
    typealias Output = Int
    
    private var wrapped: PassthroughSubject<Int, Failure>
    
    private func isEven(value: Int) -> Bool {
        value % 2 == 0
    }
    
    init() {
        self.wrapped = PassthroughSubject<Int, Failure>()
    }
    
    func send(_ value: Int) {
        if isEven(value: value) {
            wrapped.send(value)
        }
    }
    
    func send(subscription: any Subscription) {
        wrapped.send(subscription: subscription)
    }
    
    func send(completion: Subscribers.Completion<Failure>) {
        wrapped.send(completion: completion)
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Int == S.Input {
        wrapped.receive(subscriber: subscriber)
    }
}

let subject = EvenSubject<Never>()
let cancellable = subject.sink { value in
    print(value)
}

subject.send(2)
subject.send(3)
subject.send(4)
subject.send(5)



















struct ViewModel {
    
}
