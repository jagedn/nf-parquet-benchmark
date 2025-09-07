include { splitParquet; toParquet } from 'plugin/nf-parquet'

import records.MrceProjection

params.input = "$baseDir/data/MRCE_5percentFDR.parquet"

params.gene = 'RAB18'
params.startPost = 27.0

workflow {
    Channel.fromPath(params.input)
        .splitParquet(record:MrceProjection)
        .filter{ it.gene() == params.gene && it.PosStart() > params.startPost}
        .count()
        .view()
}
