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

package demo.simulations;

//
// TODO auto-generated type
//

import inet.networks.base.WiredNetworkBase;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.Eth10M;
import inet.node.ethernet.EthernetSwitch;
import inet.node.inet.StandardHost;

network Network extends WiredNetworkBase
{
    @display("bgb=1099,498");
    types:
    submodules:
        source_1: StandardHost {
            @display("p=350,100");
        }
        destination: StandardHost {
            @display("p=996,100");
        }
        source_2: StandardHost {
            @display("p=350,331");
        }
        source_3: StandardHost {
            @display("p=996,331");
        }
        switch_1: EthernetSwitch {
            @display("p=534,199");
        }
        switch_2: EthernetSwitch {
            @display("p=798,199");
        }
    connections:
        source_1.ethg++ <--> dfd: Eth10M { @display("t=10Mbps-1ms-5m,,#1A5FB4"); delay = 1ms; length = 5m; } <--> switch_1.ethg++;
        source_2.ethg++ <--> Eth10M { @display("t=10Mbps-5ms-50m,,#1A5FB4,#1A5FB4"); delay = 5ms; length = 50m; } <--> switch_1.ethg++;
        switch_2.ethg++ <--> Eth10M {  delay = 1ms; length = 5m;@display("t=10mbps-1ms-5m,,#1A5FB4"); } <--> destination.ethg++;
        switch_2.ethg++ <--> Eth10M {  delay = 1ms; length = 5m;@display("t=10Mbps-1ms-5m,,#1A5FB4"); } <--> source_3.ethg++;
        switch_1.ethg++ <--> Eth10M { @display("t=10Mbps-10ms-100m,,#1A5FB4"); delay = 10ms; length = 100m; } <--> switch_2.ethg++;
}
