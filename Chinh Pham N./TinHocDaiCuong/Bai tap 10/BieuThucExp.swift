//
//  BieuThucExp.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin

struct BieuThucExp {
    func tinhX(_ x: Float) -> Float {
        return (exp(x) + 1 / exp(x)) / 2
    }
    
    func display() {
        print("Nhập X:")
        let x = readLine()
        
        if let valueX = x as NSString? {
            print("Kết quả là = \(tinhX(valueX.floatValue))")
        }

    }
}
