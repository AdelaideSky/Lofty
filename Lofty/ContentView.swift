//
//  ContentView.swift
//  Lofty
//
//  Created by Adélaïde on 24/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationStack {
            
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 210))], spacing: 20) {
                        ForEach(0..<10) { index in
                            Button(action: { selection = index }) {
                                
                                VStack(alignment: .center) {
                                    if #available(macOS 15.0, *) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(MeshGradient(width: 3, height: 3, points: [
                                                .init(0, 0), .init(0.5, 0), .init(1, 0),
                                                .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
                                                .init(0, 1), .init(0.5, 1), .init(1, 1)
                                            ], colors: [
                                                .red, .purple, .indigo,
                                                .orange, .white, .blue,
                                                .yellow, .green, .mint
                                            ]))
                                            .frame(width: 200, height: 120)
                                            .padding(2.5)
                                            .overlay {
                                                if selection == index {
                                                    RoundedRectangle(cornerRadius: 13)
                                                        .stroke(.tint, lineWidth: 5)
                                                }
                                            }
                                    } else {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.blue)
                                            .frame(width: 200, height: 120)
                                            .padding(3)
                                            .overlay {
                                                if selection == index {
                                                    RoundedRectangle(cornerRadius: 13)
                                                        .stroke(.tint, lineWidth: 5)
                                                }
                                            }
                                    }
                                    
                                    Text("My Wallpaper \(index+1)")
                                        .font(.caption).bold()
                                        .padding(.top, 3)
                                }
                                
                            }
                        }
                        Button(action: {}) {
                            VStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.secondary.opacity(0.2))
                                    .frame(width: 200, height: 120)
                                    .padding(3)
                                    .overlay {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.secondary)
                                            .font(.largeTitle)
                                            .bold()
                                    }
                                Text("New...")
                                    .font(.caption).bold()
                                    .padding(.top, 3)
                                
                            }
                        }
                    }.buttonStyle(.plain)
                }.contentMargins(20)
            }
                .inspector(isPresented: .init(get: {
                    selection != nil
                }, set: {
                    if !$0 { selection = nil }
                })) {
                    DetailView()
                        .inspectorColumnWidth(min: 250, ideal: 300, max: 400)
                    
                }
                .navigationTitle("Lofty")
                .searchable(text: .constant(""), prompt: "Filter Wallpapers")
                
        }
    }
}

struct DetailView: View {
    @State var editing: Bool = false
    var body: some View {
        Form {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(.indigo)
                    .frame(width: 200, height: 120)
                    .padding(3)
                Spacer()
            }
            TextField("Title", text: .constant("My Wallpaper"))
                .disabled(!editing)
            
            
            Section("Description") {
                TextEditor(text: .constant("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."))
                    .foregroundStyle(.primary.opacity(editing ? 0.8 : 0.6))
                    .textEditorStyle(.plain)
                    .padding(.horizontal, -5)
                    .font(.body)
                    .disabled(!editing)
            }
            
//
//            Section("Grouping") {
//                
//            }
            Section("Other") {
                Picker("Category", selection: .constant("My Category")) {
                    Text("My Category").tag("My Category")
                    Text("My Other Category").tag("My Other Category")
                }
                Toggle("Include in Shuffle", isOn: .constant(true))
                    .disabled(!editing)
                LabeledContent("Actions") {
                    
                    Menu(editing ? "Save" : "Edit", content: {
                        if editing {
                            Section {
                                Button("Discard changes") {}
                            }
                        }
                        Button("Delete...", systemImage: "trash", role: .destructive) {}
                    }, primaryAction: { editing.toggle() }).controlSize(.regular)
                }
            }
        }
    }
}

#Preview {
    ContentView().frame(width: 900, height: 700)
}
