//
//  LobbyView.swift
//  multipeer_test
//
//  Created by Pepo on 09/11/25.
//


import SwiftUI
import MultipeerConnectivity

struct LobbyView: View {
    @StateObject var session = MultipeerSession()

    var body: some View {
        VStack(spacing: 20) {
            Text("Rail Co-op Lobby")
                .font(.title)

            if !session.isConnected {
                Button("Host Game") {
                    session.startHosting()
                }

                Button("Join Game") {
                    session.startBrowsing()
                }
                


                List(session.discoveredPeers, id: \.self) { peer in
                    HStack {
                        Text(peer.displayName)
                        Spacer()
                        Button("Connect") {
                            session.invite(peer: peer)
                        }
                    }
                }
            } else {
                Text("Connected to: \(session.connectedPeers.first?.displayName ?? "")")
                Text("✅ Ready to play")
                
                Button("Enviar Mensagem de Teste") {
                        let msg = "hello from \(session.myPeerID.displayName)"
                        session.send(data: msg.data(using: .utf8)!)
                    }

            }
        }
        .padding()
    }
}
