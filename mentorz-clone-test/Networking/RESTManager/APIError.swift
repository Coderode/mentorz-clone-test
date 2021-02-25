//
//  NetrowkError.swift
//  Snippet
//
//  Created by Himanshu Singh on 18/01/21.
//

import UIKit

public class APIHitError : Error {
    public var errorDescription:String
    public var errorCode : Int
    init(_ description: String,_ code: Int) {
        self.errorDescription = description
        self.errorCode = code
    }
}
