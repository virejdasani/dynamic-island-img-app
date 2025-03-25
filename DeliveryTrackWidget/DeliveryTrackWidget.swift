//
//  DeliveryTrackWidget.swift
//  DeliveryTrackWidget
//
//  Created by Batikan Sosun on 13.08.2022.
//

import ActivityKit
import WidgetKit
import SwiftUI

@main
struct Widgets: WidgetBundle {
    var body: some Widget {
        if #available(iOS 16.1, *) {
            GroceryDeliveryApp()
        }
    }
}

@available(iOSApplicationExtension 16.1, *)
struct GroceryDeliveryApp: Widget {
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GroceryDeliveryAppAttributes.self) { context in
            LockScreenView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    dynamicIslandExpandedLeadingView(context: context)
                 }
                 
                 DynamicIslandExpandedRegion(.trailing) {
                     dynamicIslandExpandedTrailingView(context: context)
                 }
                 
                 DynamicIslandExpandedRegion(.center) {
                     dynamicIslandExpandedCenterView(context: context)
                 }
                 
                DynamicIslandExpandedRegion(.bottom) {
                    dynamicIslandExpandedBottomView(context: context)
                }
                
              } compactLeading: {
                  compactLeadingView(context: context)
              } compactTrailing: {
                  compactTrailingView(context: context)
              } minimal: {
                  minimalView(context: context)
              }
              .keylineTint(.cyan)
        }
    }
    
    
    //MARK: Expanded Views
    func dynamicIslandExpandedLeadingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
        VStack {
            Label {
                Text("d")
                    .font(.title2)
            } icon: {
                Image("miffySmall")
                    .foregroundColor(.green)
            }
        }
    }
    
    func dynamicIslandExpandedTrailingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
        Label {
            Text("e")
                .font(.title2)
        } icon: {
            Image("miffySmall")
                .foregroundColor(.green)
        }
    }
    
    func dynamicIslandExpandedBottomView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
        let url = URL(string: "LiveActivities://?CourierNumber=87987")
        return Link(destination: url!) {
            Label("Talk to Miffy", systemImage: "phone")
        }.foregroundColor(.green)
    }
    
    func dynamicIslandExpandedCenterView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
        Text("Miffy is alive thanks to Virej")
            .lineLimit(1)
            .font(.caption)
    }
    
    
    //MARK: Compact Views
    func compactLeadingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
        VStack {
            Label {
                Text("c")
            } icon: {
                Image("miffySmall")
                    .foregroundColor(.green)
            }
            .font(.caption2)
        }
    }
    
    func compactTrailingView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
        Text("a")
    }
    
    func minimalView(context: ActivityViewContext<GroceryDeliveryAppAttributes>) -> some View {
        VStack(alignment: .center) {
            Text("b")
        }
    }
}





@available(iOSApplicationExtension 16.1, *)
struct LockScreenView: View {
    var context: ActivityViewContext<GroceryDeliveryAppAttributes>
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .center) {
                    Text("Your Miffy is skipping rope!").font(.headline)
                    Text("Your Miffy was made by Virej Dasani")
                        .font(.subheadline)
                    BottomLineView()
                }
            }
        }.padding(15)
    }
}

struct BottomLineView: View {
//    var time: Date
    var body: some View {
        HStack {
            Divider().frame(width: 50,
                            height: 10)
            .overlay(.gray).cornerRadius(5)
            Image("miffySmall")
        }
    }
}
