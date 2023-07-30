# 1C:Enterprise server keytab file.
# default - usr1cv83.keytab file in 1C:Enterprise server
#           installation directory
#
SRV1CV8_KEYTAB=/opt/1cv8/x86_64/8.3.23.1782/usr1cv8.keytab

# Cluster agent main port
SRV1CV8_PORT=1540

# Cluster main port for default cluster.
# This port is used by the cluster agent to address
# the central server. Cluster port is also specified
# as the IP port of the working server.
SRV1CV8_REGPORT=1541

# Port range for connection pool
# example values:
#   45:49
#   45:67,70:72,77:90
SRV1CV8_RANGE=1560:1591

# 1C:Enterprise server configuration debug mode
# DEBUG off: empty (default)
# TCP    on: -debug or "-debug -tcp"
# HTTP   on: "-debug -http"
SRV1CV8_DEBUG=

# Path to directory with cluster data
SRV1CV8_DATA=/home/usr1cv8/.1cv8/1C/1cv8

# Security level:
# 0 - default - unprotected connections
# 1 - protected connections only for the time of user
#     authentication
# 2 - permanently protected connections
SRV1CV8_SECLEV=0

# Check period for connection loss detector, milliseconds
SRV1CV8_PINGPERIOD=1000

# Response timeout for connection loss detector, milliseconds
SRV1CV8_PINGTIMEOUT=5000

/opt/1cv8/x86_64/8.3.23.1782/ragent \
                        -d ${SRV1CV8_DATA} \
                        -port ${SRV1CV8_PORT} \
                        -regport ${SRV1CV8_REGPORT} \
                        -range ${SRV1CV8_RANGE} \
                        -seclev ${SRV1CV8_SECLEV} \
                        -pingPeriod ${SRV1CV8_PINGPERIOD} \
                        -pingTimeout ${SRV1CV8_PINGTIMEOUT} \
                        $SRV1CV8_DEBUG