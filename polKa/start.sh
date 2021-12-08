#!/bin/bash

export FREERTR=/rtr
export POLKA=$HOME/polKa

tmux new-session -d -s rare 'java -jar $FREERTR/rtr.jar routersc $POLKA/ams0001-hw.txt $POLKA/ams0001-sw.txt' 
tmux split-window -v -t 0 -p 50 
tmux send 'java -jar $FREERTR/rtr.jar routersc $POLKA/fra0001-hw.txt $POLKA/fra0001-sw.txt' ENTER; 
tmux split-window -h -t 0 -p 50
tmux send 'java -jar $FREERTR/rtr.jar routersc $POLKA/gva0001-hw.txt $POLKA/gva0001-sw.txt' ENTER;
tmux split-window -h -t 2 -p 50
tmux send 'java -jar $FREERTR/rtr.jar routersc $POLKA/rio0001-hw.txt $POLKA/rio0001-sw.txt' ENTER;
tmux split-window -v -t 0 -p 50
tmux send 'java -jar $FREERTR/rtr.jar routersc $POLKA/tcd0021-hw.txt $POLKA/tcd0021-sw.txt' ENTER;
tmux split-window -v -t 2 -p 50
tmux send 'java -jar $FREERTR/rtr.jar routersc $POLKA/par0101-hw.txt $POLKA/par0101-sw.txt' ENTER;
tmux split-window -v -t 4 -p 50
tmux send 'java -jar $FREERTR/rtr.jar routersc $POLKA/poz0001-hw.txt $POLKA/poz0001-sw.txt' ENTER;
tmux split-window -v -t 6 -p 50
tmux send 'java -jar $FREERTR/rtr.jar routersc $POLKA/bud0001-hw.txt $POLKA/bud0001-sw.txt' ENTER;
tmux split-window -v -t 6 -p 50
tmux send 'java -jar $FREERTR/rtr.jar routersc $POLKA/pra0101-hw.txt $POLKA/pra0101-sw.txt' ENTER;
tmux split-window -v -t 4 -p 50
tmux send 'java -jar $FREERTR/rtr.jar routersc $POLKA/mc36021-hw.txt $POLKA/mc36021-sw.txt' ENTER; 
tmux a;
