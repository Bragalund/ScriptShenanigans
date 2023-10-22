#!/bin/bash
sudo ifconfig wlp3s0 down;
sudo macchanger wlp3s0 -r;
sudo ifconfig wlp3s0 up;

