#!/bin/bash
# por Everson

# Inicia o desafio 3.
# Altere RTR se o rtr.jar estiver em outro caminho.
if [ -z "$RTR" ]; then
  if [ -f "../../rtr.jar" ]; then
    RTR="../../rtr.jar"
  else
    RTR="../../rtr/rtr.jar"
  fi
fi
HWSW=${HWSW:-./}
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
sleep 1

tmux new-session -d -s "$SESSION" "java -jar $RTR routersc ${HWSW}r1/r1-hw.txt ${HWSW}r1/r1-sw.txt"

tmux split-window -v -t "$SESSION":0.0
tmux send-keys -t "$SESSION":0.1 "java -jar $RTR routersc ${HWSW}r2/r2-hw.txt ${HWSW}r2/r2-sw.txt" C-m

tmux split-window -h -t "$SESSION":0.1
tmux send-keys -t "$SESSION":0.2 "java -jar $RTR routersc ${HWSW}r3/r3-hw.txt ${HWSW}r3/r3-sw.txt" C-m

tmux select-layout -t "$SESSION" tiled
tmux attach -t "$SESSION"
