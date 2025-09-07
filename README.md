# CSV vs. Parquet Nextflow Plugin Comparison

This project aims to compare the performance of Nextflow's CSV and Parquet plugins by running a series of data processing pipelines on two different datasets. The goal is to highlight the efficiency gains, particularly in terms of storage and processing time, that can be achieved by using the **Parquet format**.

-----

## Datasets

The project uses two example datasets to demonstrate the performance differences:

* **`gene_rpkm_matrix_HBC_day0_day7`**: This is a smaller dataset used for a baseline comparison.
* **`MRCE_5percentFDR`**: This is a larger, more realistic dataset. Its CSV version is huge (110 MB) and has to be compressed for efficient storage. The compressed CSV file is 26 MB, while the equivalent Parquet file is significantly smaller at just 17 MB. This dataset clearly illustrates the storage benefits of the Parquet format.

-----

## Project Structure

The project is structured with two main types of pipelines:

1.  **Conversion Pipelines**: These pipelines, named **`convert`** and **`convertMrce`**, are used to convert the raw CSV data into the Parquet format. This is the initial step to prepare the data for the comparison.

2.  **Search Pipelines**: These pipelines perform various search and data manipulation tasks on both the CSV and Parquet versions of the datasets. By running the same operations on both data formats, we can directly compare the execution times and resources consumed, demonstrating the performance advantages of Parquet.

-----

## Running the Project

To run this project, you'll need a working Nextflow installation and the necessary plugins for CSV and Parquet. Follow these steps:

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/jagedn/nf-parquet-benchmark 
    cd nf-parquet-benchmark
    cd data
    unzip MR*.zip
    cd .. 
    ```

2.  **Run the Conversion Pipeline:** First, convert the CSV data to Parquet.

    ```bash
    nextflow run convert.nf
    nextflow run convertMrce.nf
    ```

3.  **Run the Search Pipelines:** Now, run the search pipelines on both the CSV and Parquet data to perform the comparison.

    ```bash
    time nextflow run search_mcre_csv.nf
    time nextflow run search_mcre_parquet.nf
    time nextflow run search_mcre_projection.nf
    ```

After the runs complete, you can analyze the Nextflow reports to compare the execution times, CPU usage, and memory consumption for the different pipelines. The results should clearly show the improved performance when processing the Parquet files.

For example, these are the results in my laptop

   ```bash
    time nextflow run search_mcre_csv.nf
   
     N E X T F L O W   ~  version 25.07.0-edge
    
    Launching `search_mcre_csv.nf` [peaceful_ptolemy] DSL2 - revision: 4d70b72f7c
    
    3384
    
    real	0m7,888s
    user	0m28,881s
    sys	0m1,126s
    
    time nextflow run search_mcre_parquet.nf

     N E X T F L O W   ~  version 25.07.0-edge
    
    Launching `search_mcre_parquet.nf` [stupefied_feynman] DSL2 - revision: 4f9460e097
    
    3384
    
    real	0m5,714s
    user	0m15,665s
    sys	0m0,802s

    time nextflow run search_mcre_projection.nf
    
     N E X T F L O W   ~  version 25.07.0-edge
    
    Launching `search_mcre_projection.nf` [backstabbing_swirles] DSL2 - revision: 8704ffa7f3
    
    3384
    
    real	0m5,655s
    user	0m12,780s
    sys	0m0,705s
   ```

As you can see, CSV format took more than double of time to filter the data that optimized projection parquet 

(Readme generated at 99% by an AI because I'm a bit lazzy)