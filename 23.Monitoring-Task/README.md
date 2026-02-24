##  Configured the 'Grafana' using docker.  
```bash    
docker run -itd --name grafana --network host grafana/grafana   
docker ps  # to confirm the container status
```  
## Configured the 'Prometheus' and 'Node Exporter' using APT(Ubuntu Native).  
```bash    
sudo apt update  
sudo apt install prometheus  
sudo apt install prometheus-node-exporter  
sudo service prometheus status  
sudo service prometheus-node-exporter status  
```   
  
## Configured the Dashboard using below steps:  
* After logged into the Grafana, configured data source to fetch metrics select `Connections -> Data Source -> Prometheus`.  
* In that prometheus data source configuration, used the prometheus url `http://localhost:9090`. Used localhost because grafana and prometheus are in same server itself.  
* Then saved and tested this data source. I got Successfully queried message.  
* Created a dashboard using, `Dashboard -> Create Dashboard -> Add Visualization`.   
*   Visualizations used
    * CPU & MEM has time series(with percentage representation).  
    ```promql    
    # A - For CPU, Custom Legend 'CPU'
    100 - ( avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)  

    # B - For MEM, Custom Legend 'MEM'
    ( 1 - ( node_memory_MemAvailable_bytes{instance="localhost:9100"} / node_memory_MemTotal_bytes{instance="localhost:9100"})) * 100  
    ```  
    * NET I/O has time series(with kilobytes data representation).   
    ```promql   
    # Title : NET I/O   
    # A - For NET IN, Custom Legend 'IN'
    sum(rate(node_network_receive_bytes_total{instance="localhost:9100"}[5m]))  

    # B - For NET OUT, Custom Legend 'OUT'
    sum(rate(node_network_transmit_bytes_total{instance="localhost:9100"}[5m])) 
    ```    
    * DISK has gauge(with percentage representation).    
    ```promql   
    # Title : DISK USAGE (%)   
     100 * (
              1 -
              (
                node_filesystem_avail_bytes{
                  instance="localhost:9100",
                  mountpoint="/",
                  fstype!~"tmpfs|overlay"
                }
                /
                node_filesystem_size_bytes{
                  instance="localhost:9100",
                  mountpoint="/",
                  fstype!~"tmpfs|overlay"
                }
              )
            )
    ```       
    
