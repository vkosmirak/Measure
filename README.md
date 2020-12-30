# Measure
Simple way to measure duration of function in Swift

### Log:
```
Measure: 1.0072 (MyPlayground sleep() line 35)`
```

### Installation:

Drag & drop `Measure.swift` into project


## How to use


### 1. Function

```swift
voidFunction()
```
->
```swift
measure {
    voidFunction()
}
```

### 2. Function with return value

```swift
let users = Users.loadFromDatabase()
```
->
```swift
let users = measure { Users.loadFromDatabase() }
```

### 3. Function with throwing error

```swift
let user = try JSONDecoder().decode(User.self, from: json)
```
->
```swift
let user = try measure { try JSONDecoder().decode(User.self, from: json) }
```

### 4. Named measuring

```swift
voidFunction()
```
->
```swift
measure("Just function") {
    voidFunction()
}
```
