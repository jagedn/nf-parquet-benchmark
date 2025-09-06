include { splitParquet; toParquet } from 'plugin/nf-parquet'

import records.Row

params.index = "$baseDir/data/gene_rpkm_matrix_HBC_day0_day7.csv"
params.output = "$baseDir/data/gene_rpkm_matrix_HBC_day0_day7.parquet"

workflow {
    Channel.fromPath(params.index)
        .splitCsv(header:false, skip:1) \
        .map{ row->
                int column=0
              def ret = new Row(
		        row[column++],
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
                row[column++] as float,
	          )

	          return ret
	    }
        .toParquet( params.output, [record:Row])
}
