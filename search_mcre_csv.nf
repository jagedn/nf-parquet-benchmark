params.input = "$baseDir/data/MRCE_5percentFDR.csv"

params.gene = 'RAB18'
params.startPost = 27.0

workflow {
    Channel.fromPath(params.input)
        .splitCsv(header:true)
        .filter{ it['gene'] == params.gene && it['PosStart'] as Float > params.startPost}
        .count()
        .view()
}
