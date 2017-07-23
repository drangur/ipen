#!/bin/bash

#PMU Traffic; Delay 0ms w/o DS
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-sPDC-0-0.csv -F csv results/Test3-0-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-sPDC-0-1.csv -F csv results/Test3-0-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-sPDC-0-2.csv -F csv results/Test3-0-?\.vec

#PMU Traffic; Delay 0ms w/ DS
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-sPDC-DS-0-0.csv -F csv results/Test3-0-DS-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-sPDC-DS-0-1.csv -F csv results/Test3-0-DS-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-sPDC-DS-0-2.csv -F csv results/Test3-0-DS-?\.vec

#Cross Traffic; Delay 0ms w/o DS
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-Recv-0-0.csv -F csv results/Test3-0-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-Recv-0-1.csv -F csv results/Test3-0-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-Recv-0-2.csv -F csv results/Test3-0-?\.vec

#Cross Traffic; Delay 0ms w/ DS
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-Recv-DS-0-0.csv -F csv results/Test3-0-DS-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-Recv-DS-0-1.csv -F csv results/Test3-0-DS-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-Recv-DS-0-2.csv -F csv results/Test3-0-DS-?\.vec

#Received Packets; Delay 0ms
scavetool s -p "module(**sPDC.udp) AND **rcvdPk:count**" -O proc_results/rcvdPk-sPDC-0.csv -F csv results/Test3-0*.sca
scavetool s -p "module(**Receiver.udp) AND **rcvdPk:count**" -O proc_results/rcvdPk-Recv-0.csv -F csv results/Test3-0*.sca


#PMU Traffic; Delay 20ms w/o DS
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-sPDC-20-0.csv -F csv results/Test3-20-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-sPDC-20-1.csv -F csv results/Test3-20-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-sPDC-20-2.csv -F csv results/Test3-20-?\.vec

#PMU Traffic; Delay 20ms w/ DS
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-sPDC-DS-20-0.csv -F csv results/Test3-20-DS-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-sPDC-DS-20-1.csv -F csv results/Test3-20-DS-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-sPDC-DS-20-2.csv -F csv results/Test3-20-DS-?\.vec

#Cross Traffic; Delay 20ms w/o DS
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-Recv-20-0.csv -F csv results/Test3-20-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-Recv-20-1.csv -F csv results/Test3-20-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-Recv-20-2.csv -F csv results/Test3-20-?\.vec

#Cross Traffic; Delay 20ms w/ DS
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-Recv-DS-20-0.csv -F csv results/Test3-20-DS-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-Recv-DS-20-1.csv -F csv results/Test3-20-DS-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-Recv-DS-20-2.csv -F csv results/Test3-20-DS-?\.vec

#Received Packets; Delay 20ms
scavetool s -p "module(**sPDC.udp) AND **rcvdPk:count**" -O proc_results/rcvdPk-sPDC-20.csv -F csv results/Test3-20*.sca
scavetool s -p "module(**Receiver.udp) AND **rcvdPk:count**" -O proc_results/rcvdPk-Recv-20.csv -F csv results/Test3-20*.sca


#PMU Traffic; Delay 40ms w/o DS
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-sPDC-40-0.csv -F csv results/Test3-40-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-sPDC-40-1.csv -F csv results/Test3-40-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-sPDC-40-2.csv -F csv results/Test3-40-?\.vec

#PMU Traffic; Delay 40ms w/ DS
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-sPDC-DS-40-0.csv -F csv results/Test3-40-DS-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-sPDC-DS-40-1.csv -F csv results/Test3-40-DS-?\.vec
scavetool v -p "module(**sPDC**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-sPDC-DS-40-2.csv -F csv results/Test3-40-DS-?\.vec

#PMU Traffic; Delay 40ms w/o DS
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-Recv-40-0.csv -F csv results/Test3-40-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-Recv-40-1.csv -F csv results/Test3-40-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-Recv-40-2.csv -F csv results/Test3-40-?\.vec

#PMU Traffic; Delay 40ms w/ DS
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=954)" -O proc_results/e2e-Recv-DS-40-0.csv -F csv results/Test3-40-DS-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1204)" -O proc_results/e2e-Recv-DS-40-1.csv -F csv results/Test3-40-DS-?\.vec
scavetool v -p "module(**Receiver**) AND **endToEndDelay** AND attr:measurement(\$size=1454)" -O proc_results/e2e-Recv-DS-40-2.csv -F csv results/Test3-40-DS-?\.vec

#Received Packets; Delay 40ms
scavetool s -p "module(**sPDC.udp) AND **rcvdPk:count**" -O proc_results/rcvdPk-sPDC-40.csv -F csv results/Test3-40*.sca
scavetool s -p "module(**Receiver.udp) AND **rcvdPk:count**" -O proc_results/rcvdPk-Recv-40.csv -F csv results/Test3-40*.sca


#Queue Length / queuing Time; Delay 0ms
scavetool v -p "module(**PIM2.ppp[0].queue**) AND **queueLength:vector** AND attr:measurement(\$size=954)" -O proc_results/queueLength-0-0.csv -F csv results/Test3-0-?\.vec
scavetool v -p "module(**PIM2.ppp[0].queue**) AND **queueLength:vector** AND attr:measurement(\$size=1204)" -O proc_results/queueLength-0-1.csv -F csv results/Test3-0-?\.vec
scavetool v -p "module(**PIM2.ppp[0].queue**) AND **queueLength:vector** AND attr:measurement(\$size=1454)" -O proc_results/queueLength-0-2.csv -F csv results/Test3-0-?\.vec

#Queue Length / queuing Time; Delay 20ms
scavetool v -p "module(**PIM2.ppp[0].queue**) AND **queueLength:vector** AND attr:measurement(\$size=954)" -O proc_results/queueLength-20-0.csv -F csv results/Test3-0-?\.vec
scavetool v -p "module(**PIM2.ppp[0].queue**) AND **queueLength:vector** AND attr:measurement(\$size=1204)" -O proc_results/queueLength-20-1.csv -F csv results/Test3-0-?\.vec
scavetool v -p "module(**PIM2.ppp[0].queue**) AND **queueLength:vector** AND attr:measurement(\$size=1454)" -O proc_results/queueLength-20-2.csv -F csv results/Test3-0-?\.vec

#Queue Length / queuing Time; Delay 40ms
scavetool v -p "module(**PIM2.ppp[0].queue**) AND **queueLength:vector** AND attr:measurement(\$size=954)" -O proc_results/queueLength-40-0.csv -F csv results/Test3-0-?\.vec
scavetool v -p "module(**PIM2.ppp[0].queue**) AND **queueLength:vector** AND attr:measurement(\$size=1204)" -O proc_results/queueLength-40-1.csv -F csv results/Test3-0-?\.vec
scavetool v -p "module(**PIM2.ppp[0].queue**) AND **queueLength:vector** AND attr:measurement(\$size=1454)" -O proc_results/queueLength-40-2.csv -F csv results/Test3-0-?\.vec