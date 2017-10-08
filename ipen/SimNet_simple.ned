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

package inet.examples.sdndemo.ipen;

import inet.node.inet.INetworkNode;
import inet.node.inet.StandardHost;
import inet.node.mpls.RSVP_LSR;
import inet.node.inet.Router;
import inet.node.inet.MulticastRouter;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.ethernet.EtherSwitch;
//import inet.examples.inet.netperfmeter;
//  !!! NOTE:						   !!!		
//  !!! Channels defined in SimNet.ned !!!
//
//channel Ether10M extends ned.DatarateChannel
//{
//    datarate = default(10 Mbps);
//    delay = default(50 ms);   
//}
//
//channel Ether1G extends ned.DatarateChannel
//{
//   datarate = 1Gbps;
//}


//channel bottleNeck extends netperfmeter {

//}

channel Ether2M extends ned.DatarateChannel
{
    datarate = default(2 Mbps);
    delay = default(50ms);
}


network SimNet_simple
{
    parameters:
        int numPMU = default(1);
        int numSources = default(1);

        double channelDelay @unit("ms") = default(50ms);
        double channelBer = default(0.0);
        double channelPer = default(0.0);
        double channelDatarate @unit("Mbps") = default(2 Mbps);

        @display("bgb=1187,547;bgl=2");
    submodules:
        Receiver: StandardHost {
            parameters:
                forwarding = false;
                @display("p=264,172;i=old/laptop3");
            gates:
                ethg[1];
        }
        Source[numSources]: StandardHost {
            //Source: StandardHost {
            parameters:
                @display("p=845.61,83.369995");
                forwarding = false;
            gates:
                ethg[1];
        }

        sPMU[numPMU]: StandardHost {
            parameters:
                forwarding = false;
                @display("p=672,443");
            gates:
                ethg[1];
        }

        sPDC: StandardHost {
            parameters:
                forwarding = false;
                @display("p=364,366");
            gates:
                ethg[1];
        }


        PIM1: MulticastRouter {
            parameters:
                // config for external interfaces
                @display("p=672,173;i=abstract/multicast;t=ext");
                numExtInterfaces = 1;

            gates:
                ethg[2];
        }


        PIM2: MulticastRouter {
            parameters:
                @display("p=672,295;i=abstract/multicast");
            gates:
                // ethg[3];
                ethg[2];
                pppg[1];
        }
        PIM3: MulticastRouter {
            parameters:
                @display("p=364,295;i=abstract/multicast");
            gates:
                // ethg[3];
                ethg[2];
                pppg[1];
        }
        PIM4: MulticastRouter {
            parameters:
                // config for external interfaces
                @display("p=364,173;t=ext;i=abstract/multicast");
                numExtInterfaces = 1;
            gates:
                ethg[3];
        }
        PIM5: MulticastRouter {
            parameters:
                // config for external interfaces
                @display("p=516,173;t=ext");
                numExtInterfaces = 1;
            gates:
                ethg[1];
        }

        Switch1: EtherSwitch {
            @display("p=672,365");
        }

        Switch2: EtherSwitch {
            @display("p=845.61,181.62749");
        }

        configurator: IPv4NetworkConfigurator {
            @display("p=1067,433");
        }

    connections:

        PIM1.ethg[0] <--> Ethernet1G <--> PIM2.ethg[0];
        PIM2.pppg[0] <--> Ether2M { @display("ls=goldenrod4,3"); delay = channelDelay; ber = channelBer; per = channelPer; } <--> PIM3.pppg[0];
        // PIM2.ethg[1] <--> Ether2M { @display("ls=goldenrod4,3"); delay=channelDelay; ber=channelBer; per=channelPer;} <--> PIM3.ethg[0];
        PIM3.ethg[0] <--> Ethernet1G <--> PIM4.ethg[0];
        // PIM3.ethg[1] <--> Ethernet1G <--> PIM4.ethg[0];
        //PIM4.ethg[2] <--> Ether2M { @display("ls=goldenrod4,3"); delay = channelDelay; ber = channelBer; per = channelPer; datarate = 2Mbps; } <--> PIM5.ethg[0];
		PIM4.ethg[2] <--> Ethernet10M{delay=50ms;datarate=10Mbps;} <--> PIM5.ethg[0];

        Receiver.ethg[0] <--> Ethernet1G <--> PIM4.ethg[1];
        //Source.ethg[0] <--> Ethernet1G <--> PIM1.ethg[1];

        Switch2.ethg++ <--> Ethernet1G <--> PIM1.ethg[1];
        for i=0..numSources-1 {
            Source[i].ethg[0] <--> Ethernet1G <--> Switch2.ethg++;
        }

        Switch1.ethg++ <--> Ethernet1G <--> PIM2.ethg[1];
        //Switch1.ethg++ <--> Ethernet1G <--> PIM2.ethg[2];
        for i=0..numPMU-1 {
            sPMU[i].ethg[0] <--> Ethernet1G <--> Switch1.ethg++;
        }
        // sPDC.ethg[0] <--> Ethernet1G <--> PIM3.ethg[2];
        sPDC.ethg[0] <--> Ethernet1G <--> PIM3.ethg[1];

}
