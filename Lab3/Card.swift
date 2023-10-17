import Foundation
import SwiftUI

struct CardView: View {
    
    @State private var isCovered: Bool = false
    @State var item: String = "ikona"
    
    var body: some View {
        
            Group{
                if (isCovered){
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.blue, lineWidth:2)
                        .fill(.white)
                        .frame(height: 30)
                        .overlay{
                            Text(item)
                                .font(.largeTitle)
                        }
                }else{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.blue, lineWidth:2)
                        .fill(.blue)
                        .frame(height: 30)
                }
            }
            .onTapGesture{
                isCovered.toggle()
            }
           
        
        
    }
}

#Preview {
    CardView()
}
