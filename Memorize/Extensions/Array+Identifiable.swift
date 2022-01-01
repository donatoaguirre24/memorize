//
//  Array+Identifiable.swift
//  memorize
//
//  Created by Donato Aguirre on 9/13/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0 ..< count where self[index].id == matching.id {
            return index
        }
        return nil
    }
}
