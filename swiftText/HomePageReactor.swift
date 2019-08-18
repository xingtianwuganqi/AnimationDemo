//
//  HomePageReactor.swift
//  swiftText
//
//  Created by jingjun on 2018/8/29.
//  Copyright © 2018年 景军. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift
import RxDataSources

typealias dataSection = SectionModel<Void,String>
final class HomePageReactor: Reactor {
    enum Action {
        case load
    }
    enum Mutation {
        case setLoadData
    }
    struct State {
        var data : [dataSection] = []
    }
    
    var initialState: HomePageReactor.State
    
    init() {
        initialState = State(data: [dataSection(model: Void(), items: [
            "这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试",
            "这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试，这是一个多行测试",
            "这是一个label字体颜色测试",
            "这个一个label背景颜色测试",
            "这是一个label测试",
            "这个一个label测试",
            "这是一个label测试",
            "这个一个label测试"
            ])])
    }
    
    func mutate(action: HomePageReactor.Action) -> Observable<HomePageReactor.Mutation> {
        switch action {
        case .load:
            return Observable.just(Mutation.setLoadData)
        
        }
    }
    func reduce(state: HomePageReactor.State, mutation: HomePageReactor.Mutation) -> HomePageReactor.State {
        var state = state
        switch mutation {
        case .setLoadData:
            break
        
        }
        return  state
    }
}
