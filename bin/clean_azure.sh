#!/bin/bash

for i in `azure group list | grep kitchen | awk '{print $2}'`
do
     azure group delete -q --nowait $i
done
