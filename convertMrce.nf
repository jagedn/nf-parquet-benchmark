include { splitParquet; toParquet } from 'plugin/nf-parquet'

import records.Mrce

params.index = "$baseDir/data/MRCE_5percentFDR.csv"
params.output = "$baseDir/data/MRCE_5percentFDR.parquet"

workflow {
    Channel.fromPath(params.index)
        .splitCsv(header:false, skip:1) \
        .filter{ row -> !row.find{ it == "."} } //some fields are empties, skip them
        .map{ row->
                int column=0

              def ret = new Mrce(
		        row[column++],
                row[column++],
                row[column++],
                row[column++] as Integer,
                row[column++] as Float,
                row[column++],
                row[column++],
                row[column++] as Float,
                row[column++] as Float,
                row[column++] as Float,
                row[column++] as Float,
                row[column++] as Float,
                row[column++] as Float,
                row[column++],
                row[column++],
                row[column++] as Float,
                row[column++] as Float,
                row[column++] ,
                row[column++] as Float,
                row[column++] as Float,
	          )

	          return ret
	    }
        .toParquet( params.output, [record:Mrce])
}
