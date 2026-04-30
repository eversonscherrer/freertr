#!/bin/bash
# por Everson

# Variáveis de ambiente.
# Altere RTR se o rtr.jar estiver em outro caminho.
RTR=${RTR:-../../rtr/rtr.jar}
HWSW=${HWSW:-.}
SESSION=${SESSION:-rare}

if [ ! -f "$RTR" ]; then
  echo "Arquivo rtr.jar não encontrado: $RTR"
  echo "Use, por exemplo: RTR=/caminho/rtr.jar ./script.sh"
  exit 1
fi

if ! command -v tmux >/dev/null 2>&1; then
  echo "tmux não encontrado. Instale com: sudo apt install tmux"
  exit 1
fi

tmux kill-session -t "$SESSION" 2>/dev/null

tmux new-session -d -s "$SESSION" "java -jar $RTR routersc $HWSW/r1-hw.txt $HWSW/r1-sw.txt"
tmux split-window -v -t "$SESSION":0 -p 50
tmux send-keys -t "$SESSION":0 "java -jar $RTR routersc $HWSW/r2-hw.txt $HWSW/r2-sw.txt" ENTER
tmux split-window -h -t "$SESSION":0.0 -p 50
tmux send-keys -t "$SESSION":0 "java -jar $RTR routersc $HWSW/r3-hw.txt $HWSW/r3-sw.txt" ENTER
tmux select-layout -t "$SESSION" tiled
tmux attach -t "$SESSION"
