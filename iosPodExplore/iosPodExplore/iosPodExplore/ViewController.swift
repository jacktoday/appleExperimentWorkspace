//
//  ViewController.swift
//  iosPodExplore
//
//  Created by fulin on 10/10/21.
//

import UIKit
import RxSwift
import RxRelay

class ViewController: UIViewController {
   
    private let bag = DisposeBag()
    private let images = BehaviorRelay<[UIImage]>(value: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        //observables: read only
    /*let one = 1
    let two = 2
    let three = 3
    
    let observable = Observable<Int>.just(one)
    */
        /*
    let observable2 = Observable.of(one, two, three)
        observable2.subscribe { event in
            if let element = event.element {
                print(element)
            }
        }
        
    }*/
        /*
        let observable2 = Observable.of(one, two, three)
        observable2.subscribe(onNext: { element in
            print(element)
        }, onError: { error in
            print("error: \(error)")
        }, onCompleted: {
            print("completed")
        }, onDisposed: {
            print("disposed")
        })
        */
        /*
        let observable3 = Observable<Void>.never()
        observable3.subscribe(onNext: { element in
            print(element)
        }, onError: { error in
            print("error: \(error)")
        }, onCompleted: {
            print("completed")
        }, onDisposed: {
            print("disposed")
        })
        */

        /*
        let observable4 = Observable<Int>.range(start: 1, count: 10)
        observable4.subscribe(onNext: { element in
            print(element)
        }, onError: { error in
            print("error: \(error)")
        }, onCompleted: {
            print("completed")
        }, onDisposed: {
            print("disposed")
        })
         */
        /*
        let disposeBag = DisposeBag()
        
        Observable<String>.create {
            observer in
            observer.onNext("1")
            observer.onCompleted()
            observer.onNext("?")
            return DisposeBag.create()
        }
        */
        
        //subjects act as both observable and an observer.
        /*
        let subject = PublishSubject<String>()
        subject.on(.next("is anyone listening?"))
        let subscriptionOne = subject.subscribe(onNext: {
            string in
            print(string)
        })
        subject.on(.next("1"))
        subject.on(.next("2"))
        
        //4 type subjet in rxswift
        
        
        //Relays 继电器
        let subscriptionTwo = subject.subscribe { event in
            print("2)", event.element ?? event)
        }
        subject.onNext("3")
        
        subscriptionOne.dispose()
        subject.onNext("4")
        subject.onCompleted()
        subject.onNext("5")
        
        
        subscriptionTwo.dispose()
        let disposeBag = DisposeBag()
        
        subject.subscribe {
            print("3)", $0.element ?? $0)
        }.disposed(by: disposeBag)
        
        subject.onNext("?")
         
         */
        
        //behavior subject
        /*
        enum MyError: Error {
            case anError
        }*/
         
        /*
        let subject = BehaviorSubject(value: "Initial value")
        let disposeBag = DisposeBag()
        
        subject.subscribe {
            print("1) \($0)")
        }.disposed(by: disposeBag)
        
        subject.onNext("x")
        
        subject.onError(MyError.anError)
        subject.subscribe {
            print("2) \($0)")
        }
        .disposed(by: disposeBag)
        
        */
        
        
        //replay subject
        /*
        let subject = ReplaySubject<String>.create(bufferSize: 2)
        let disposeBag = DisposeBag()
        subject.onNext("1")
        subject.onNext("2")
        subject.onNext("3")
        
        subject.subscribe {
            print("1) \($0)")
        }.disposed(by: disposeBag)
        
        subject.subscribe {
            print("2) \($0)")
        }.disposed(by: disposeBag)
        
        subject.onNext("4")
        subject.onError(MyError.anError)
        
        subject.subscribe {
            print("3) \($0)")
        }.disposed(by: disposeBag)
        */
        
        //relay
        /*let relay = PublishRelay<String>()
        let disposeBag = DisposeBag()
        
        relay.accept("knock, anyone home?")
        relay.subscribe(onNext:  {
            print($0)
        }).disposed(by: disposeBag)
        
        relay.accept("1")
        */
        /*
        let relay = BehaviorRelay(value: "initial value")
        let disposeBag = DisposeBag()
        
        relay.accept("knock, anyone home?")
        relay.subscribe(onNext:  {
            print($0)
        }).disposed(by: disposeBag)
        
        relay.accept("1")
       */
    }

    
}

