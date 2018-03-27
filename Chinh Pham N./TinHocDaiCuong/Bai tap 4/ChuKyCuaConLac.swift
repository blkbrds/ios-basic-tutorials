//
//  ChuKyCuaConLac.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin

struct ChuKyCuaConLac {
    func tinhChuKyDaoDong(l: Float) -> String {
        var t: Float = 0.0
        let g: Float = 9.18
        
        t = 2 * Float.pi * sqrt(l/g)
        
        return (l < 0 ? "Không tính được!" : "Chu kỳ của con lắc là = \(String(t))")
    }
    
    func display() {
        print("Nhập chiều dài của con lắc: ")
        let l = readLine()
        
        if let value = l as NSString? {
            print(tinhChuKyDaoDong(l: value.floatValue))
        }
    }
}
