#!/bin/bash
# por Everson

SESSION=${SESSION:-rip-fullmesh}
tmux kill-session -t "$SESSION"
