//
//  GameView.swift
//  multipeer_test
//
//  Created by Pepo on 09/11/25.
//


import SwiftUI
import MultipeerConnectivity

struct GameView: View {
    @ObservedObject var session: MultipeerSession

    var body: some View {
        VStack(spacing: 20) {
            Text("Tela do Jogo")
                .font(.largeTitle)

            Text("Jogadores conectados:")
            ForEach(session.connectedPeers, id: \.self) { peer in
                Text(peer.displayName)
            }

            Button("Voltar para o Lobby") {
                session.gameStarted = false
            }
            .buttonStyle(.bordered)
            .padding(.top, 40)
        }
        .padding()
    }
}
