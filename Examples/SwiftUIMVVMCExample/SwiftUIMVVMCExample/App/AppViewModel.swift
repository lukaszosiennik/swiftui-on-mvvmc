//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI_MVVMC

protocol AppViewModelProtocol: ViewModelProtocol
where Coordinator: AppCoordinatorProtocol {}

final class AppViewModel<
    Coordinator: AppCoordinatorProtocol
>: ViewModel<Coordinator>, AppViewModelProtocol {}
