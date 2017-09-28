//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package inet.examples.ipen;

import inet.node.inet.StandardHost;
import inet.node.mpls.RSVP_LSR;
import inet.node.inet.Router;
import inet.node.inet.MulticastRouter;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.ethernet.EtherSwitch;

channel Ethernet10M extends ned.DatarateChannel
{
    datarate = default(10 Mbps);
    delay = default(50 ms);   
}

channel dialup extends ned.DatarateChannel
        {
            delay = normal(0.004s, 0.0018s);
            datarate = 128kbps;
}

channel Ethernet1G extends ned.DatarateChannel
{
    datarate = 1Gbps;
}


network SimNet
{
    parameters:
        int numPMU = default(1);

        @display("bgb=1187,547;bgl=2");
    submodules:
        Receiver: StandardHost {
            parameters:
                forwarding = false;
                @display("p=44,34;i=old/laptop3");
            gates:
                pppg[1];
        }
        Source: StandardHost {
            parameters:
                @display("p=1139,58");
                forwarding = false;
            gates:
                pppg[1];
        }

        PMU[numPMU]: StandardHost {
            parameters:
                forwarding = false;
                @display("p=758,21");
            gates:
                ethg[1];
        }

        PDC: StandardHost {
            parameters:
                forwarding = false;
            gates:
                pppg[1];
        }

        LSR1: RSVP_LSR {
            parameters:
                peers = "ppp0 ppp2";
                numExtInterfaces = 1;
                @display("p=158,131");
            gates:
                pppg[3];
        }
        LSR2: RSVP_LSR {
            parameters:
                peers = "ppp0 ppp1 ppp2";
                @display("p=178,290");
            gates:
                pppg[3];
        }
        LSR3: RSVP_LSR {
            parameters:
                peers = "ppp0 ppp2";
                @display("p=432,344");
            gates:
                pppg[3];
        }
        LSR4: RSVP_LSR {
            parameters:
                peers = "ppp0 ppp1 ppp2";
                @display("p=375,83");
            gates:
                pppg[4];
        }
        PIM1: MulticastRouter {
            parameters:
                @display("p=1084,134");
                numExtInterfaces = 1;
            gates:
                pppg[3];
        }
        PIM2: MulticastRouter {
            parameters:
                @display("p=848,290");
            gates:
                pppg[4];
        }
        PIM3: MulticastRouter {
            parameters:
                @display("p=630,344");
            gates:
                pppg[4];
        }
        PIM4: MulticastRouter {
            parameters:
                @display("p=887,83");
            gates:
                pppg[3];
                ethg[1];
        }
        PIM5: MulticastRouter {
            parameters:
                @display("p=669,83");
            gates:
                pppg[4];
        }

        PMUSwitch: EtherSwitch {
            @display("p=829,53");
        }

        configurator: IPv4NetworkConfigurator {
            @display("p=1067,433");
        }

    connections:

        LSR1.pppg[0] <--> Ethernet1G <--> LSR2.pppg[0];
        LSR2.pppg[1] <--> Ethernet1G <--> LSR3.pppg[0];
        LSR3.pppg[1] <--> Ethernet1G <--> PIM3.pppg[1];
        LSR4.pppg[0] <--> Ethernet1G <--> LSR1.pppg[2];
        LSR4.pppg[1] <--> Ethernet1G <--> LSR2.pppg[2];
        LSR4.pppg[2] <--> Ethernet1G <--> LSR3.pppg[2];
        LSR4.pppg[3] <--> Ethernet1G <--> PIM5.pppg[3];
        PIM5.pppg[0] <--> Ethernet1G <--> PIM4.pppg[2];
        PIM5.pppg[1] <--> Ethernet1G <--> PIM2.pppg[3];
        PIM5.pppg[2] <--> Ethernet1G <--> PIM3.pppg[2];
        PIM4.pppg[0] <--> Ethernet1G <--> PIM1.pppg[2];
        PIM4.pppg[1] <--> Ethernet1G <--> PIM2.pppg[2];
        PIM2.pppg[1] <--> Ethernet10M <--> PIM3.pppg[0];
        PIM1.pppg[0] <--> Ethernet1G <--> PIM2.pppg[0];

        Receiver.pppg[0] <--> Ethernet1G <--> LSR1.pppg[1];
        Source.pppg[0] <--> Ethernet1G <--> PIM1.pppg[1];

		PMUSwitch.ethg++ <--> Ethernet1G <--> PIM4.ethg[0];
		for i=0 .. numPMU-1 {
			PMU[i].ethg[0] <--> Ethernet1G <--> PMUSwitch.ethg++;
		}
        PDC.pppg[0] <--> Ethernet1G <--> PIM3.pppg[3];


}
