include { splitParquet; toParquet } from 'plugin/nf-parquet'

import records.Mrce

params.input = "$baseDir/data/MRCE_5percentFDR.parquet"

params.gene = 'RAB18'
params.startPost = 27.0

workflow {
    Channel.fromPath(params.input)
        .splitParquet(record:Mrce)
        .filter{ it.gene() == params.gene && it.PosStart() > params.startPost}
        .count()
        .view()
}
