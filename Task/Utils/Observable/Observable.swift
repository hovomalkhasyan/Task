//
//  Observable.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation

public final class Observable<Value> {
    
    struct Observer<Value> {
        weak var observer: AnyObject?
        let block: (Value) -> Void
    }
    
    // MARK: - Properties
    private var observers = [Observer<Value>]()
    
    public var value: Value {
        didSet { notifyObservers() }
    }
    
    // MARK: - Init
    public init(_ value: Value) {
        self.value = value
    }
    
    // MARK: - Methods
    public func observe(on observer: AnyObject, observerBlock: @escaping (Value) -> Void) {
        observers.append(Observer(observer: observer, block: observerBlock))
    }
    
    public func updateValue(_ update: (inout Value) -> Void) {
        var x = value
        update(&x)
        value = x
    }
    
    public func remove(observer: AnyObject) {
        observers = observers.filter { $0.observer !== observer }
    }
    
    public func removeAll() {
        observers = [Observer<Value>]()
    }
    
    private func notifyObservers() {
        for observer in observers {
            DispatchQueue.main.async { observer.block(self.value) }
        }
    }
}
