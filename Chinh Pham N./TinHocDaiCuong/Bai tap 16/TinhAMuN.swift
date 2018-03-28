//
//  TinhAMuN.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin

struct TinhAMuN {
    func tinh(_ a: Float, _ n: Float) {
        if a < 0 {
            print("Không tính được!")
        } else {
            print("A mủ N là: \(exp(n * log(a)))")
        }
    }
    
    func display() {
        print("Nhập A:")
        let a = readLine()
        
        print("Nhập N:")
        let n = readLine()
        
        if let valueA = a as NSString?, valueN = n as NSString? {
            
        }
    }
}
