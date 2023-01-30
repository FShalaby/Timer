//
//  ProgressBar.swift
//  Timer
//
//  Created by Fouad Shalaby on 2022-08-29.
//

import SwiftUI

struct ProgressBar: View {
      var width : CGFloat = 200
      var height : CGFloat = 20
      var percent : CGFloat = 100
     
      var body : some View {
         
         ZStack ( alignment: .leading ) {
           RoundedRectangle ( cornerRadius: height , style: .continuous )
                 .frame ( width: percent , height: height )
             .foregroundColor ( Color.black.opacity ( 0.1 ) )
           RoundedRectangle ( cornerRadius: height , style: .continuous )
                 .frame ( width : percent , height : height )
              .background (
                LinearGradient ( gradient: Gradient ( colors: [ Color.icon , Color.blue ] ) ,
                  startPoint: .leading , endPoint: .trailing )
                  .clipShape ( RoundedRectangle ( cornerRadius: height , style:
                     .continuous ) )
             )
              .foregroundColor ( .clear )
         }
      }
    
}
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
