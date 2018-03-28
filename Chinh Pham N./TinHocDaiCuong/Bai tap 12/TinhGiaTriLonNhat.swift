//
//  TinhGiaTriLonNhat.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation

struct TinhGiaTriLonNhat {
    func timSoLOnNhat(arr: [Int]) -> Int {
        var a: Int = 0
        var c: Int = 0
        for i in 0..<arr.count {
            a = arr[i] + ((i + 1) == arr.count ? 0 : arr[i + 1])
            if a > c {
                c = a
            }
        }
        return c
    }
    func display() {
        print("=> Result: \(timSoLOnNhat(arr: [3, -2, 4, 5]))")
    }
}
