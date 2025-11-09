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
    
    var isHost: Bool {
        session.advertiser != nil
    }


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
            } else if !session.gameStarted {
                Text("Connected to: \(session.connectedPeers.first?.displayName ?? "")")
                Text("✅ Ready to play")

                if isHost {
                    Button("Play") {
                        session.startGame()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 20)
                }

            } else {
                GameView(session: session)   // ← aqui vamos para o Grid Scene depois
            }

        }
        .padding()
    }
}
