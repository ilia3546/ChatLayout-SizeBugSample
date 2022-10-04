//
//  Record.swift
//  ChatLayoutBugSample
//
//  Created by Ilya Kharlamov on 10/4/22.
//

import Foundation
import DifferenceKit

struct Record: Identifiable, Differentiable {
    
    let id: Int
    let text: String
    var size: CGSize
    var differenceIdentifier: Int { self.id }
    
    func isContentEqual(to source: Record) -> Bool {
        return self.text == source.text && self.size == source.size
    }
    
}
