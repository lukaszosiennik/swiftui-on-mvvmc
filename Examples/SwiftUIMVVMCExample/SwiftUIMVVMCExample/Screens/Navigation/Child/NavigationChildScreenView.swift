//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

struct NavigationChildScreenView<ViewModel: NavigationChildScreenViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let params: Params
    
    var body: some View {
        VStack {
            Text("NavigationChild Screen")
            
            Spacer().frame(height: 20)
            
            Button("Button GoTo forward") {
                viewModel.coordinator.navigationPathAppend(ViewModel.Coordinator.RouteID.second)
            }
            Button("Button GoTo backward") {
                viewModel.coordinator.navigationPathRemoveLast(1)
            }
            Button("Button clear path") {
                viewModel.coordinator.navigationPathClear()
            }
        }
    }
}

#Preview {
    NavigationChildScreenView(
        viewModel: NavigationChildScreenVM(
            coordinator: NavigationChildScreenCoordinator(parent: nil)
        ),
        params: .init(
            number: 0
        )
    )
}
