## The directory where the reference is used
##SNAP_REFERENCEDIR='/reference/ftp.broadinstitute.org/bundle/hg38/Homo_sapiens_assembly38.snap/'
SNAP_REFERENCEDIR='/remote/reference/mitocondria/NCBI_NC_012920.1_Homo_sapiens_mitochondrion.snap/'

## Here you should set aditional options for snap
##
## In example, SURPI defaults:
##SNAP_OPTS='-x -f -h 250 -n 25'
#SNAP_OPTS='-h 250 -n 25'
SNAP_OPTS=''

## To filter unmatched regions:
#SNAP_OPTS=$SNAP_OPTS' -F u'

## Recommended options by organism:
##
## - Human:
#SNAP_OPTS=$SNAP_OPTS' -d 12'

## Recommended cache options:
##
## - lots of memory:
##SNAP_OPTS=$SNAP_OPTS' -map'	##Disabled for mitochondrial alignment

## - less memory:
#SNAP_OPTS+=' -pre -map'

## By default SNAP uses all available cores.
## to use less cores, uncomment the following option,
## where 24 is the max number of cores you want to use:
#SNAP_OPTS=$SNAP_OPTS' -t 24'
