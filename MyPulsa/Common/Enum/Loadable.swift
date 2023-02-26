//
//  Loadable.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import Foundation

enum Loadable<Value> {
    case notRequested
    case isLoading(prevValue: Value?)
    case loaded(Value)
    case failed(Error)
}

extension Loadable {
    var value: Value? {
        switch self {
        case .notRequested, .failed: return nil
        case let .loaded(value): return value
        case let .isLoading(value): return value
        }
    }
    var error: Error? {
        switch self {
        case let .failed(error): return error
        default: return nil
        }
    }
    var isLoading: Bool {
        switch self {
        case .isLoading: return true
        default: return false
        }
    }
    var isLoaded: Bool {
        switch self {
        case .loaded: return true
        default: return false
        }
    }
    var isFailed: Bool {
        switch self {
        case .failed: return true
        default: return false
        }
    }
}

extension Loadable: Equatable where Value: Equatable {
    static func == (lhs: Loadable<Value>, rhs: Loadable<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.notRequested, .notRequested):
            return true
        case let (.isLoading(lhsPrev), .isLoading(rhsPrev)):
            return lhsPrev == rhsPrev
        case let (.loaded(lhsValue), .loaded(rhsValue)):
            return lhsValue == rhsValue
        case let (.failed(lhsError), .failed(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default: return false
        }
    }
}
