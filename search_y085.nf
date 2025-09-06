include { splitParquet; toParquet } from 'plugin/nf-parquet'

import records.Y085

params.input = "$baseDir/data/gene_rpkm_matrix_HBC_day0_day7.parquet"

params.greatherThan= 0.3 as float

workflow {
    Channel.fromPath(params.input)
        .splitParquet(record:Y085)
        .filter{ it.Y085_First_tri_day0_fresh() > params.greatherThan as float}
        .count()
        .view()
}
