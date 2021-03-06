//
//  main.swift
//  RxSwiftBasic
//
//  Created by Kelvin HT on 11/16/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import RxSwift

print("Hello, This is Practice RxSwift Tutorial\n")

print("\n01. Basic Observable - Bilangan Ganjil")
Observable.of("1", "2", "3", "4", "5")
    .map { Int($0) ?? 0 }
    .filter { $0%2 == 1 }
    .do(onNext: { print("\($0) adalah bilangan ganjil")})
    .toArray()
    .map { $0.count }
    .subscribe(onSuccess: { print("Total bilangan ganjil adalah \($0)") })

print("\n02. Multi-Threading with Schedulers")
getEmployeeNames()
    .observeOn(MainScheduler.instance)
    .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    .subscribe(onNext: { print($0) })

print("\n03. Single Disposable")
let disposable = Observable.of("1", "2", "3", "4", "5", "6")
  .map { Int($0) ?? 0 } .filter { $0%2 == 1 }
  .do(onNext: { print("\($0) adalah bilangan ganjil") })
  .toArray()
  .map { $0.count }
  .subscribe(onSuccess: { print("Total bilangan ganjil adalah \($0)") })
disposable.dispose()

print("\n04. Multiple Disposable")
let disposable02 = Observable.of("1", "2", "3", "4", "5", "6")
  .map { Int($0) ?? 0 } .filter { $0%2 == 1 }
  .do(onNext: { print("\($0) adalah bilangan ganjil") })
  .toArray()
  .map { $0.count }
  .subscribe(onSuccess: { print("Total bilangan ganjil adalah \($0)") })
 
let disposable03 = getEmployeeNames()
  .observeOn(MainScheduler.instance)
  .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
  .subscribe(onNext: { print($0) })
 
let multiDisposables = CompositeDisposable(disposable02, disposable03)
multiDisposables.dispose()
