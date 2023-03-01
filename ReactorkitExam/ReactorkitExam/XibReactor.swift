//
//  XibReactor.swift
//  ReactorkitExam
//
//  Created by Chaekyeong Lee on 2023/03/01.
//

import Foundation
import ReactorKit
import RxCocoa
import RxSwift

final class XibReactor: Reactor {
    let initialState: State = State()
    
    enum Action {
      // 여러 액션들을 정의
      case increase
      case decrease
    }

    enum Mutation {
      // State값을 바꾸는 가장 작은 단위
      case increaseValue
      case decreaseValue
    }

    struct State {
      // 값이나 상태값
      var value: Int = 0
      var isLoading: Bool = false

    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            case .increase:
                return Observable.just(Mutation.increaseValue)
            case .decrease:
                return Observable.just(Mutation.decreaseValue)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
         var newState = state
        
        switch mutation {
            case .increaseValue:
                newState.value += 1
            case.decreaseValue:
                newState.value -= 1
        }
        
        return newState
    }
    
}
