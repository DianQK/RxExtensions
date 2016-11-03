//
//  IDHashable.swift
//  RxExtensions
//
//  Created by DianQK on 29/09/2016.
//  Copyright © 2016 T. All rights reserved.
//

import Foundation
import RxDataSources

public protocol IDHashable: Hashable {
    associatedtype ID: Hashable
    var id: ID { get }
}

extension IDHashable {
    public var hashValue: Int {
        return id.hashValue
    }

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Hashable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

extension IdentifiableType where Self: IDHashable {
    public var identity: Self.ID {
        return id
    }
}
