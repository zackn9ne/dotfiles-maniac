#!/bin/sh

loginctl show-session $(loginctl|grep $(whoami) |awk '{print $1}') -p Type

