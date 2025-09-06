params.input = "$baseDir/data/gene_rpkm_matrix_HBC_day0_day7.csv"

params.greatherThan= 0.3 as float

workflow {
    Channel.fromPath(params.input)
        .splitCsv(header:true)
        .filter{ it['Y085_First.tri_day0.fresh'] as float > params.greatherThan}
        .count()
        .view()
}
