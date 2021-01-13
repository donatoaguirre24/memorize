//
//  Array+Only.swift
//  memorize
//
//  Created by Donato Aguirre on 9/16/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
