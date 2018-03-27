# Grand Central Dispatch Crash Course for Swift 3

### GCD là gì?

Grand Central Dispatch được phát triển bởi Apple để đơn giản hóa công việc với hệ thống với bộ vi xử lý đa lõi và được phát hành với Mac OS X Snow Leopard và iOS 4.

### Dispatch Queues

Dispatch queues quản lý các tasks theo thứ tự FIFO. Các task chạy theo thứ tự mà chúng được thêm vào queue — task đầu tiên trong queue sẽ chạy đầu tiên.

Có 2 loại dispatch queues:

#### Serial Queues

- Thực thi 1 task tại 1 thời điểm
- Có thể được sử dụng để đồng bộ hóa quyền truy cập vào một tài nguyên cụ thể

![Serial Queue](https://koenig-media.raywenderlich.com/uploads/2014/09/Serial-Queue-Swift.png)

#### Concurrent Queues

- Thực thi 1 hoặc nhiều tasks đồng thời
- Các task hoàn thành tuỳ theo độ phức tạp chứ ko phải thứ tự trong queue

![Concurrent Queue](https://koenig-media.raywenderlich.com/uploads/2014/09/Concurrent-Queue-Swift.png)

### Synchronous vs. Asynchronous

Khi sử dụng dispatch queues, bạn có thể chọn để thực thi code đồng bộ hoặc bất đồng bộ

Với việc thực hiện đồng bộ, chương trình đợi công việc hoàn thành trước khi return.

Với việc thực hiện không đồng bộ, chương trình sẽ return ngay lập tức mà không cần phải chờ cho công việc hoàn thành.

```swift
func doSyncWork() {
  DispatchQueue.global().sync { for _ in 1...3 { print(“Light”) } }
  for _ in 1...3 { print(“Heavy”) }
} // main

doSyncWork()
// Light
// Light
// Light
// Heavy
// Heavy
// Heavy
```

```swift
func doAsyncWork() {
 DispatchQueue.global().async { for _ in 1...3 { print(“Light”) } }
 for _ in 1...3 { print(“Heavy”) } 
} // main

doAsyncWork()
// Light
// Heavy
// Heavy
// Light
// Heavy
// Light
```



### Thread Safety

Dispatch queues là thread safe. Chúng có thể được truy cập đồng thời từ các threads khác nhau mà không bị locking. Các developers có thể dùng dispatch queues để làm code của họ thread safe.

### Các loại Dispatch Queues

#### Main Queue

Khi app của bạn khởi chạy, hệ thống sẽ tự động tạo ra 1 serial queue và liên kết nó với main thread của app.  Tất cả các tasks UI phải được chạy trên main thread.

#### Global Queues

Có 4 global concurrent queues được cung cấp và chia sẻ bởi hệ thống.

Thuộc tính Quality of Service chỉ ra mức độ ưu tiên của các tasks trong queue:

- User-interactive: cập nhật UI hoặc khác tasks nhỏ khác mà nên xảy ra ngay lập tức.
- User-initiated: các tasks trong queue này là các tasks nên chạy ngay lập tức - như là mở các documents hoặc phản ứng với các hành động của user. Các tasks nên hoàn hành trong vài giây hoặc ít hơn. Sẽ được map tới High priority queue.
- Utility: queue này dành cho các tasks dài hơn mà nên hoàn thành ngay lập tức (các tasks với 1 loading bar như là downloading hoặc importing).
- Background: các tasks mà cần hàng phút đến hàng giờ để hoàn thành — indexing, syncing, etc… Queue này được tối ưu hoá năng lượng và bất kỳ hành động disk I/O đều bị hạn chế.

```swift
let background = DispatchQueue.global(qos: .background) // lower importance

let userInitiated = DispatchQueue.global(qos: .userInitiated) // higher importance

func doLightWorks() {
 background.async { for _ in 1...10 { print("👷🏻") } }
 userInitiated.async { for _ in 1...10 { print("👷🏾") } } 
}

doLightWorks() // 👷🏾, 👷🏻, 👷🏾, 👷🏻, 👷🏾, 👷🏾, 👷🏻, 👷🏾, 👷🏾, 👷🏾, 👷🏻, 👷🏾,👷🏾, 👷🏾, 👷🏻, 👷🏻, 👷🏻, 👷🏻, 👷🏻, 👷🏻
```



#### Custom Queues

Serial queues phải được tạo và quản lý bởi developer. Bạn củng có thể tạo các custom concurrent queues, nhưng thay vào đó bạn nên sử dụng một trong các global queues. 

### Code examples

#### Làm việc với system queues

```swift
DispatchQueue.global(qos: .utility).async {
    // Code chạy bất đồng bộ trên priority queue
}

DispatchQueue.main.async {
    // Code chạy bất đồng bộ trên main queue
}

DispatchQueue.global(qos: .userInitiated).sync {
    // Code chạy đồng bộ trên high prioriy queue
}
```

#### Làm việc với custom queues

```swift
let customSerialQueue = DispatchQueue(label: "com.yogevsitton.MyApp.myCustomSerialQueue")
customSerialQueue.async {
    // Code
}


let customConcurrentQueue = DispatchQueue(label: "com.yogevsitton.MyApp.myCustomConcurrentQueue", attributes: .concurrent)
customConcurrentQueue.async {
    // Code
}
```

#### Thực hiện các tasks background, sau đó cập nhật UI

```swift
DispatchQueue.global(qos: .background).async {
    // Làm các công việc ở background
    DispatchQueue.main.async {
        // Cập nhật UI khi công việc đã hoàn thành
    }
}
```

#### Cẩn thận deadlocks với serial queues

```swift
let customSerialQueue = DispatchQueue(label: "com.yogevsitton.MyApp.myCustomSerialQueue")

customSerialQueue.sync {
    // code chạy đồng bộ
    customSerialQueue.sync {
        // Đoạn code này sẽ không bao giờ được thực thị, app sẽ bị deadlock
    }
}
```

#### **Cẩn thận khi chạy đồng bộ trên main thread từ một background thread chạy đồng bộ**

```swift
DispatchQueue.global(qos: .utility).sync {
    // Background Task
    DispatchQueue.main.sync {
        // App sẽ crash
    }
}
```

### Where to go from here?

- [Grand Central Dispatch Tutorial for Swift 3: Part 1/2](https://www.raywenderlich.com/148513/grand-central-dispatch-tutorial-swift-3-part-1)
- [Common Background Practices](https://www.objc.io/issues/2-concurrency/common-background-practices/)
- [Thread-Safe Class Design](https://www.objc.io/issues/2-concurrency/thread-safe-class-design/#practical-thread-safe-design)

### References

- [Grand Central Dispatch Crash Course for Swift 3](https://medium.com/modernnerd-code/grand-central-dispatch-crash-course-for-swift-3-8bf2652c1cb8)
- [Grand Central Dispatch Tutorial for Swift 3: Part 1/2](https://www.raywenderlich.com/148513/grand-central-dispatch-tutorial-swift-3-part-1)


