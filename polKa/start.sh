#!/bin/bash

tmux new-session -d -s rare 'java -jar /freertr/rtr.jar routersc /freertr/everson/polka/rare/ams0001-hw.txt /freertr/everson/polka/rare/ams0001-sw.txt' 
tmux split-window -v -t 0 -p 50 
tmux send 'java -jar /freertr/rtr.jar routersc /freertr/everson/polka/rare/fra0001-hw.txt /freertr/everson/polka/rare/fra0001-sw.txt' ENTER; 
tmux split-window -h -t 0 -p 50
tmux send 'java -jar /freertr/rtr.jar routersc /freertr/everson/polka/rare/gva0001-hw.txt /freertr/everson/polka/rare/gva0001-sw.txt' ENTER;
tmux split-window -h -t 2 -p 50
tmux send 'java -jar /freertr/rtr.jar routersc /freertr/everson/polka/rare/rio0001-hw.txt /freertr/everson/polka/rare/rio0001-sw.txt' ENTER;
tmux split-window -v -t 0 -p 50
tmux send 'java -jar /freertr/rtr.jar routersc /freertr/everson/polka/rare/tcd0021-hw.txt /freertr/everson/polka/rare/tcd0021-sw.txt' ENTER;
tmux split-window -v -t 2 -p 50
tmux send 'java -jar /freertr/rtr.jar routersc /freertr/everson/polka/rare/par0101-hw.txt /freertr/everson/polka/rare/par0101-sw.txt' ENTER;
tmux split-window -v -t 4 -p 50
tmux send 'java -jar /freertr/rtr.jar routersc /freertr/everson/polka/rare/poz0001-hw.txt /freertr/everson/polka/rare/poz0001-sw.txt' ENTER;
tmux split-window -v -t 6 -p 50
tmux send 'java -jar /freertr/rtr.jar routersc /freertr/everson/polka/rare/bud0001-hw.txt /freertr/everson/polka/rare/bud0001-sw.txt' ENTER;
tmux split-window -v -t 6 -p 50
tmux send 'java -jar /freertr/rtr.jar routersc /freertr/everson/polka/rare/pra0101-hw.txt /freertr/everson/polka/rare/pra0101-sw.txt' ENTER;
tmux split-window -v -t 4 -p 50
tmux send 'java -jar /freertr/rtr.jar routersc /freertr/everson/polka/rare/mc36021-hw.txt /freertr/everson/polka/rare/mc36021-sw.txt' ENTER; 
tmux a;
