#!/bin/bash
for data in pheme_drop_unverified pheme_all
do
    for rationale_ratio in 0.5 0.3
    do
        for thresholder in top_k #contiguous
        do
            CUDA_DEVICE=0 \
            OUTPUT_DIR=/data/joe/misinformation/FRESH/output/ \
            DATASETS_FOLDER=/data/joe/misinformation/FRESH/ \
            DATASET_NAME=$data \
            CLASSIFIER=bert_classification \
            BERT_TYPE=bert-base-uncased \
            EXP_NAME=fresh \
            MAX_LENGTH_RATIO=$rationale_ratio \
            SALIENCY=wrapper \
            THRESHOLDER=$thresholder \
            EPOCHS=10 \
            BSIZE=8 \
            HUMAN_PROB=0 \
            bash Rationale_Analysis/commands/fresh/fresh_with_extractor_script.sh
        done
    done
done
