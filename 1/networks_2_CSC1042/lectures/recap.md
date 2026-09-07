# Computer Networks 2 CSC1042 - 07/09/26

## Network recap
### Types of Networks
* PAN - Personal Area Network
  * smallest (<10m)
  * eg. smart watch, phone, etc.
* LAN - Local Area Network
  * <1km
  * eg. home or office
* MAN - Metropolitan Area Network
  * bigger than LAN
  * eg. company with offices in different cities
* WAN - Wider Area Network
  * biggest, spans whole country or continent
  * 

### Network Topologies
* Bus
  * One cable
  * hard to locate fault
  * csma/cd to negotiate which device can use the bus
* Star
  * central network device
  * easier to locate fault
  * all devices can use network simultaneously
* Ring
  * devices connected in a ring
  * signals can only be sent either clockwise or anti-clockwise


### Transmission media
* twisted pair cable
  * shielded or unshielded
  * 100m range
  * needs a repeater for longer ranges
* coaxial Cable
  * 500m range
  * used 
* fibre optice cable
  * uses light 
* radio waves
  * wireless
  * line of sight

### Network devices
* Network Interface Card (NIC)
  * Used to connect devices to networks
  * Each NIC has a unique ID (MAC address)
* Repeater
  * Physical layer
  * Amplifies and regenerates signals
  * Extends transmission distances
* Hub
  * Physical layer
  * Basically a multi-port repeater
  * Data received in one port is sent to all connected devices
* Bridge
  * Data link layer
  * Similar to repeater but with MAC address filtering
  * Connects multiple LANs to create a larger LAN
* Switch
  * Data link layer
  * Connects multiple LANs
  * Similar to a bridge but can error check
* Router
  * Network Layer
  * Routes data to devices based on IP addresses
  * Connects LANs and WANs
  * Maintain routing tables
  * Can perform error checking

### Network Models
* OSI
  * 7 Layers
  * Theoretical
* TCP/IP
  * 5 Layers
  * Practical
