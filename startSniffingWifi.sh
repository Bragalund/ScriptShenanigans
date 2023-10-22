#!/bin/bash
sudo ifconfig wlp3s0 down;
sudo macchanger -r wlp3s0;
sudo ifconfig wlp3s0 up;
sudo airmon-ng start wlp3s0;
sudo airodump-ng --output-format csv --wps --ignore-negative-one --manufacturer --uptime wlp3s0mon;

