#!/usr/bin/env zsh

SESSION_NAME=sesh

tmux has-session -t "$SESSION_NAME" 2> /dev/null

if [ "$?" -ne 0 ]; then
  TMUX='' tmux new-session -d -s "$SESSION_NAME"
fi 

if [ -z "$TMUX" ]; then
  tmux attach -t "$SESSION_NAME"
else
  tmux switch-client -t "$SESSION_NAME"
fi